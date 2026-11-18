Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795018041;
	b=kn8zW9gGhSvBZBrt2EnAECjYSAAmFdVL6nS3AqkvgWgIUOUP7NefzXrqRX9nVXKTV8s7
	 QYe2VpnraGZEx2vqmbO1rg3hoxBFEcVJyzvXWyKVPD1jgJi6wvsyVUTLwbYPk5zsFVFbp
	 7Q6v1m+isKZhMI3alUKiFOb0R9oftszkYqU0yJLhtEP41TcUCV+Bp9wKASt4Uiu1IlQsJ
	 CvpuCSMQOf2TfzWEUYWsq9mkqUlTC1UIGarqCGAv14Ai4O64lKp975uBg0OxSnB6UZZp5
	 YNaERYSnr4WcHBa1FNM/Yk8miNp/S08QEeCNhnJGIQOaGF9LAPZHLKYHjIV99WV5g9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795018041;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=L6uav2r+6Sg4v1niXur5Pp192NOfrS8Crw1mAk3xrSI=;
	b=gPlszfNRbbr/PyeAV7wDx+q/sBFfAcdDDaI1vNiLGlLVolB6hz9o5knTaW7pH6i7duPt
	 pue2D62mA1TYEU4gblWUVXwad3ZFiMENjYAlZjb0cuotar7gWc3IZB0c/7VPhxJknPMv2
	 upzEBhQ2X634X3uLOslsNZ+0sySvYlSWrQcYRdLhHGKs3ZUAcnQ4stDOqI9tVcXTgYMYs
	 H6DUeWPh9/E4pArwW3oa+R6CwYrjD4GCjBnyS04Lw8FECJmM5ivvnQnMaFjOYCffyA1TV
	 S/C/jmp1DqIDEY1LwoCY8Yr2/ukOr4LexUfbXbjknIQKubbkKbohFTR1sjKlZUALByw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QhtOkBz4;
	arc=none smtp.remote-ip=192.198.163.18
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90E21606A32F
	for <linux-leds@vger.kernel.org>; Wed, 18 Nov 2026 16:07:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90E21606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QhtOkBz4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795018040; x=1826554040;
  h=date:from:to:cc:subject:message-id;
  bh=IHuUZ0JPwNVIsZZwUYHgqM/iTGjfoZrPsdEyAVq8GBU=;
  b=QhtOkBz4UgwDvN5jl6TFAL04qaW9uZd9a0lcxczcyabydOBQRiIT/pmF
   tdfhFkeym/6gp/dkIka1j36LT6UT2EmjNVHyatBEWXZVzPNQ3mZFGag1z
   xPAgFn8687VGIwraX+i4W+4zvkcTxWfSnlEhwpfojnJSRQIY4PmKU8E/5
   65TW9vZYgYkAx+nyBd/CgpXt5eSEu4+stY9PcSsiNhdSRl8izgInxd0Lg
   V4ZycjNCkQVN2ObDHvNLpqs664nWw4QPlfpePR7LG8Srxd3GSlxDg7HTC
   vT8vSperQIeB7HmIhz2XGSOQscvuIYvzAqkwBGW+8GBhoC4iN//7hzktW
   g==;
X-CSE-ConnectionGUID: 16QVqtuiTP+GB94VYph2Ww==
X-CSE-MsgGUID: P3FXgb/eQluG72MNPW2wUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3858602"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3858602"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 08:07:20 -0800
X-CSE-ConnectionGUID: qreaqvfzS72rTm8a0p3FTw==
X-CSE-MsgGUID: yKDkg3f8TX6pnz14SI03hQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="10400815"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 18 Nov 2026 08:07:19 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xTiBo-00000001DmE-1rps;
	Wed, 18 Nov 2026 16:07:16 +0000
Date: Thu, 19 Nov 2026 00:07:14 +0800
From: kernel test robot <lkp@intel.com>
To: Lee Jones <lee@kernel.org>
Cc: linux-leds@vger.kernel.org
Subject: [lee-leds:for-leds-next] BUILD SUCCESS
 c92d6666ffaca04015e91df3b1789c15c965e3d2
Message-ID: <20261119000714.eroKDDqE-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git for-leds-next
branch HEAD: c92d6666ffaca04015e91df3b1789c15c965e3d2  leds: tca6507: Fix use-after-free on unbind

elapsed time: 1507m

configs tested: 213
configs skipped: 7

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.2.0
alpha                             allyesconfig    gcc-16.2.0
alpha                                defconfig    gcc-16.2.0
arc                               allmodconfig    clang-24
arc                                allnoconfig    gcc-16.2.0
arc                               allyesconfig    clang-24
arc                                  defconfig    gcc-16.2.0
arc                   randconfig-1000-20261118    gcc-10.5.0
arc                   randconfig-1001-20261118    gcc-10.5.0
arc                         vdk_hs38_defconfig    clang-24
arm                                allnoconfig    gcc-16.2.0
arm                               allyesconfig    clang-24
arm                      am200epdkit_defconfig    clang-24
arm                                  defconfig    gcc-16.2.0
arm                           gemini_defconfig    gcc-16.2.0
arm                            h3600_defconfig    gcc-16.2.0
arm                           ixp4xx_defconfig    gcc-16.2.0
arm                   randconfig-1000-20261118    gcc-10.5.0
arm                   randconfig-1001-20261118    gcc-10.5.0
arm                   randconfig-1002-20261118    gcc-10.5.0
arm                   randconfig-1003-20261118    gcc-10.5.0
arm                         realview_defconfig    clang-17
arm                          s3c6400_defconfig    clang-24
arm                         spear3xx_defconfig    clang-24
arm                            spitz_defconfig    gcc-16.2.0
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.2.0
arm64                                defconfig    gcc-16.2.0
arm64                 randconfig-1000-20261118    gcc-16.2.0
arm64                 randconfig-1001-20261118    gcc-16.2.0
arm64                 randconfig-1002-20261118    gcc-16.2.0
arm64                 randconfig-1003-20261118    gcc-16.2.0
csky                              allmodconfig    gcc-16.2.0
csky                               allnoconfig    gcc-16.2.0
csky                                 defconfig    gcc-16.2.0
csky                  randconfig-1000-20261118    gcc-16.2.0
csky                  randconfig-1001-20261118    gcc-16.2.0
hexagon                           allmodconfig    gcc-16.2.0
hexagon                            allnoconfig    gcc-16.2.0
hexagon                              defconfig    gcc-16.2.0
hexagon               randconfig-1000-20261118    clang-22
hexagon               randconfig-1001-20261118    clang-22
i386                              alldefconfig    clang-17
i386                              allmodconfig    clang-22
i386                               allnoconfig    gcc-16.2.0
i386                              allyesconfig    clang-22
i386        buildonly-randconfig-1000-20261118    gcc-12
i386        buildonly-randconfig-1001-20261118    gcc-12
i386        buildonly-randconfig-1002-20261118    gcc-12
i386        buildonly-randconfig-1003-20261118    gcc-12
i386        buildonly-randconfig-1004-20261118    gcc-12
i386        buildonly-randconfig-1005-20261118    gcc-12
i386                                 defconfig    gcc-16.2.0
i386                  randconfig-1000-20261118    clang-22
i386                  randconfig-1001-20261118    clang-22
i386                  randconfig-1002-20261118    clang-22
i386                  randconfig-1003-20261118    clang-22
i386                  randconfig-1004-20261118    clang-22
i386                  randconfig-1005-20261118    clang-22
i386                  randconfig-1006-20261118    clang-22
i386                  randconfig-1007-20261118    clang-22
i386                  randconfig-1008-20261118    clang-22
i386                  randconfig-1009-20261118    clang-22
i386                  randconfig-1010-20261118    clang-22
i386                  randconfig-1011-20261118    clang-22
i386                  randconfig-1012-20261118    clang-22
i386                  randconfig-1013-20261118    clang-22
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    gcc-16.2.0
loongarch                            defconfig    clang-24
loongarch             randconfig-1000-20261118    clang-22
loongarch             randconfig-1001-20261118    clang-22
m68k                              allmodconfig    gcc-16.2.0
m68k                               allnoconfig    gcc-16.2.0
m68k                              allyesconfig    clang-24
m68k                                 defconfig    clang-24
m68k                        m5249evb_defconfig    gcc-16.2.0
m68k                        m5329evb_defconfig    gcc-16.2.0
m68k                             mac_defconfig    gcc-16.2.0
m68k                         stmark2_defconfig    clang-24
microblaze                        alldefconfig    gcc-16.2.0
microblaze                         allnoconfig    gcc-16.2.0
microblaze                        allyesconfig    gcc-16.2.0
microblaze                           defconfig    clang-24
mips                              allmodconfig    gcc-16.2.0
mips                               allnoconfig    gcc-16.2.0
mips                              allyesconfig    gcc-16.2.0
mips                         bcm63xx_defconfig    gcc-16.2.0
mips                       bmips_stb_defconfig    gcc-16.2.0
mips                            jazz_defconfig    gcc-16.2.0
mips                       malta_kvm_defconfig    clang-24
mips                 malta_qemu_32r6_defconfig    clang-24
mips                          rt305x_defconfig    clang-24
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20261118    clang-22
nios2                 randconfig-1001-20261118    clang-22
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc                             defconfig    gcc-16.2.0
openrisc                     or1ksim_defconfig    gcc-16.2.0
parisc                            allmodconfig    gcc-16.2.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.2.0
parisc                randconfig-1000-20261118    gcc-8.5.0
parisc                randconfig-1001-20261118    gcc-8.5.0
parisc64                             defconfig    clang-24
powerpc                     adder875_defconfig    clang-17
powerpc                           allmodconfig    gcc-16.2.0
powerpc                            allnoconfig    clang-24
powerpc                      asp8347_defconfig    clang-24
powerpc                         cell_defconfig    gcc-16.2.0
powerpc                    currituck_defconfig    gcc-16.2.0
powerpc                         fsp2_defconfig    gcc-16.2.0
powerpc                       katmai_defconfig    clang-24
powerpc                mpc834x_itxgp_defconfig    gcc-16.2.0
powerpc                   mpc866_ads_defconfig    clang-17
powerpc                       pasemi_defconfig    clang-24
powerpc                       ppc6xx_defconfig    gcc-16.2.0
powerpc               randconfig-1000-20261118    gcc-8.5.0
powerpc               randconfig-1001-20261118    gcc-8.5.0
powerpc                      tqm8540_defconfig    clang-24
powerpc                      tqm8555_defconfig    gcc-16.2.0
powerpc64             randconfig-1000-20261118    gcc-8.5.0
powerpc64             randconfig-1001-20261118    gcc-8.5.0
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.2.0
riscv                     nommu_k210_defconfig    clang-24
riscv                 randconfig-1000-20261118    gcc-11.5.0
riscv                 randconfig-1001-20261118    gcc-11.5.0
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.2.0
s390                                 defconfig    gcc-16.2.0
s390                  randconfig-1000-20261118    gcc-11.5.0
s390                  randconfig-1001-20261118    gcc-11.5.0
s390                        zfcpdump_defconfig    clang-24
sh                                allmodconfig    gcc-16.2.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                                   defconfig    gcc-14
sh                         edosk7760_defconfig    gcc-16.2.0
sh                              espt_defconfig    clang-17
sh                           polaris_defconfig    clang-17
sh                    randconfig-1000-20261118    gcc-11.5.0
sh                    randconfig-1001-20261118    gcc-11.5.0
sh                           rsk7201_defconfig    gcc-16.2.0
sh                           rsk7269_defconfig    clang-24
sh                    rts7751r2dplus_defconfig    clang-17
sh                            se7206_defconfig    gcc-16.2.0
sh                              sh03_defconfig    clang-24
sh                   sh7785lcr_32bit_defconfig    clang-17
sh                             titan_defconfig    gcc-16.2.0
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.2.0
sparc                 randconfig-1000-20261118    gcc-16.2.0
sparc                 randconfig-1001-20261118    gcc-16.2.0
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20261118    gcc-16.2.0
sparc64               randconfig-1001-20261118    gcc-16.2.0
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.2.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20261118    gcc-16.2.0
um                    randconfig-1001-20261118    gcc-16.2.0
um                            x86_64_defconfig    gcc-14
x86_64                            allmodconfig    clang-22
x86_64                             allnoconfig    clang-24
x86_64                            allyesconfig    clang-22
x86_64      buildonly-randconfig-1000-20261118    gcc-14
x86_64      buildonly-randconfig-1001-20261118    gcc-14
x86_64      buildonly-randconfig-1002-20261118    gcc-14
x86_64      buildonly-randconfig-1003-20261118    gcc-14
x86_64      buildonly-randconfig-1004-20261118    gcc-14
x86_64      buildonly-randconfig-1005-20261118    gcc-14
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20261118    gcc-14
x86_64                randconfig-1001-20261118    gcc-14
x86_64                randconfig-1002-20261118    gcc-14
x86_64                randconfig-1003-20261118    gcc-14
x86_64                randconfig-1004-20261118    gcc-14
x86_64                randconfig-1005-20261118    gcc-14
x86_64                randconfig-1006-20261118    gcc-14
x86_64                randconfig-1007-20261118    gcc-14
x86_64                randconfig-1008-20261118    gcc-14
x86_64                randconfig-1009-20261118    gcc-14
x86_64                randconfig-1010-20261118    gcc-14
x86_64                randconfig-1011-20261118    gcc-14
x86_64                randconfig-1012-20261118    gcc-14
x86_64                randconfig-1013-20261118    gcc-14
x86_64                randconfig-1014-20261118    gcc-14
x86_64                randconfig-1015-20261118    gcc-14
x86_64                randconfig-1016-20261118    gcc-14
x86_64                randconfig-1017-20261118    gcc-14
x86_64                                rhel-9.4    clang-22
x86_64                            rhel-9.4-bpf    gcc-14
x86_64                           rhel-9.4-func    clang-22
x86_64                     rhel-9.4-kselftests    clang-22
x86_64                          rhel-9.4-kunit    gcc-14
x86_64                            rhel-9.4-ltp    gcc-14
x86_64                           rhel-9.4-rust    clang-22
xtensa                             allnoconfig    clang-24
xtensa                            allyesconfig    clang-20
xtensa                randconfig-1000-20261118    gcc-16.2.0
xtensa                randconfig-1001-20261118    gcc-16.2.0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
