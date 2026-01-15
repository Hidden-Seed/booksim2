#ifndef _TestNet_HPP_
#define _TestNet_HPP_

#include "network.hpp"
#include "routefunc.hpp"

class TestNet : public Network
{
public:
    TestNet(const Configuration &config, const string &name);
    static void RegisterRoutingFunctions();

private:
    int _a; // router num
    int _p; // node num on each router
    int _k; // port num

    void _ComputeSize(const Configuration &config);
    void _BuildNet(const Configuration &config);
};

int testnet_port(int rID, int src, int dest);

//
// Routing Functions
//
void min_testnet(const Router *r, const Flit *f, int in_channel, OutputSet *outputs, bool inject);

#endif
