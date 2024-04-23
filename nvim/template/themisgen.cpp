#include<bits/stdc++.h>
#include "testlib.h"

using namespace std;
#define ll long long
const string PROBLEM = "PROBLEM";
int ith_test = 1;

void gen() {

}

signed main(int argc, char *argv[]) {
    registerGen(argc, argv, 1);
    freopen((PROBLEM + ".INP").c_str(), "w", stdout);
    ith_test = opt<int>(1);
    gen();
}
