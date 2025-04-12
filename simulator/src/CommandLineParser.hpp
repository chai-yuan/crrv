#ifndef COMMANDLINEPARSER_H
#define COMMANDLINEPARSER_H

#include <getopt.h>
#include <string>

struct Config {
    std::string  inputFile;
    std::string  difftestFile;
    unsigned int cycle;
    unsigned int step;
    bool         trace_enable;
};

extern Config globalConfig;

void parseArguments(int argc, char *argv[]);

#endif // COMMANDLINEPARSER_H
