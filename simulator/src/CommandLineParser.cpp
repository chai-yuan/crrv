#include "CommandLineParser.hpp"

Config globalConfig = {
    .inputFile    = "test.bin",
    .difftestFile = "",
    .cycle        = 2100000000,
    .step         = 2100000000,
    .trace_enable = false,
};

struct OptionInfo {
    const char *name;    // 长选项名称
    int         has_arg; // 是否需要参数
    int        *flag;    // 标志位
    int         val;     // 选项枚举值
    const char *help;    // 帮助信息
};

static OptionInfo options[] = {{"bin", required_argument, 0, 'b', "Specify the binary path"},
                               {"diff", required_argument, 0, 'd', "Specify the difftest lib path"},
                               {"cycle", required_argument, 0, 'c', "Max cycle step"},
                               {"step", required_argument, 0, 's', "Max inst step"},
                               {"trace", no_argument, 0, 't', "Enable waveforms trace"},
                               {"help", no_argument, 0, 'h', "Display this help message"},
                               {0, 0, 0, 0, 0}};

void printHelp(const char *program_name) {
    printf("Usage: %s [OPTIONS]\n", program_name);
    printf("Options:\n");
    // 遍历选项数组，自动生成帮助信息
    for (const OptionInfo *opt = options; opt->name != 0; opt++) {
        printf("  --%-15s %s\n", opt->name, opt->help);
    }
}

void parseArguments(int argc, char *argv[]) {
    int opt;
    int option_index = 0;
    // 将 OptionInfo 转换为 getopt_long 需要的 struct option 数组
    struct option long_options[sizeof(options) / sizeof(OptionInfo)];
    for (int i = 0; options[i].name != 0; i++) {
        long_options[i].name    = options[i].name;
        long_options[i].has_arg = options[i].has_arg;
        long_options[i].flag    = options[i].flag;
        long_options[i].val     = options[i].val;
    }

    while ((opt = getopt_long(argc, argv, "", long_options, &option_index)) != -1) {
        switch (opt) {
        case 'b':
            globalConfig.inputFile = optarg;
            break;
        case 'd':
            globalConfig.difftestFile = optarg;
            break;
        case 'c':
            sscanf(optarg, "%d", &globalConfig.cycle);
            break;
        case 's':
            sscanf(optarg, "%d", &globalConfig.step);
            break;
        case 't':
            globalConfig.trace_enable = true;
            break;
        case 'h':
        default:
            printHelp(argv[0]);
            exit(0);
        }
    }
}
