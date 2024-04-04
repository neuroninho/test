using DrWatson
@quickactivate "test"
using Pkg; Pkg.instantiate()


using JLD2
using MultiComponentFlash
using JutulDarcy
using Jutul
using Images

JLD2.@load "permeability.jld2"

PermSmall = perm[ 1:300, 1:200, :]


factor = (5,5,5)                                                              # downsampling

PermSmallResized = imresize(PermSmall, (size(PermSmall, 1) ÷ factor[1], size(PermSmall, 2) ÷ factor[2], size(PermSmall, 3) ÷ factor[3]))

#size(PermSmallResized) is (60, 40, 61)


@save "PermSmallResized.JLD2" PermSmallResized