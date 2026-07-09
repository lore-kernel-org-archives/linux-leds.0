Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DDCD21E098
	for <linux-leds@vger.kernel.org>; Thu,  9 Jul 2026 14:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783608108; cv=none; b=lqlQUt4wAnZyxuVmbdgtEiKIpXi7OUVbnylAGtSj0Io/IhO2CS+0ykHyf5ld2fyyjcMU/h6znRcFuoTYyUFwtpkUK3DvIAPT2CsKO4sNL2QHOL5pP1RH9/fido276LecY1TQP21pOeZ1zb5OI94aPzPqfI0OirNmA+rGD4u84eA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783608108; c=relaxed/simple;
	bh=5Ih78TX3GzVp+cynfrI4hwLvb87i4EFxV7s5dlc6NOc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NIEo4JQUAjmeDnSsYF925pELDpsjxjtoPE+k6TOGv2QoLUm0gxq3HY1126gfb9tVw9wDECLap9xi98FxGeUyJnboERJRka06VT8zxmWmS1ZbwQnoiNm71qBBdnquH9H6j43mBtNxK3RefQTTtElbvt9kENuu31rvN/w1SIACPBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iF83KYrV; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iF83KYrV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783608106; x=1815144106;
  h=date:from:to:cc:subject:message-id;
  bh=5Ih78TX3GzVp+cynfrI4hwLvb87i4EFxV7s5dlc6NOc=;
  b=iF83KYrVxor5BWpFSEh4bd9ajUISgN+Bpwrb9rIOD+QhqwWjaTnolfbI
   GZt7ueQXi8IRh4x2QbjlbcChXpCrG4xgBJ6mfpSxIRntX+XftTHDO7Efh
   dwsxpQ38NRF7fPNtfyhW3wO40ZLkd4OZx6zCtfnI9RWOlC9hHjUm3RddR
   8jUlXH+EpGdizr7n5k5EcAe0aH76OC513SBrs4OdTMcTyZxRRjJCpoosp
   t5IZBweWjDSX21G+Ou2LjihOFdwmVFKkHRY50FVkOU3D3PMvlv5cOMPUA
   1mWEYEzXXIMjIq3loHBuScMpoFWkVYE1/ANYsODbrtm8Yg9t2aXK9IONc
   w==;
X-CSE-ConnectionGUID: wPYaA760Sd28ZephJ6y98g==
X-CSE-MsgGUID: raP4IOncSYirtSjnQ84G7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="94642592"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="94642592"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2026 07:41:46 -0700
X-CSE-ConnectionGUID: /YoloJfUQdSQiGYN+2FZaA==
X-CSE-MsgGUID: B11iu6VYQbq8dcgOQAjFWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="258209900"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 09 Jul 2026 07:41:45 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1whpwb-00000000HlH-41k7;
	Thu, 09 Jul 2026 14:41:41 +0000
Date: Thu, 09 Jul 2026 22:40:44 +0800
From: kernel test robot <lkp@intel.com>
To: Lee Jones <lee@kernel.org>
Cc: linux-leds@vger.kernel.org
Subject: [lee-leds:for-leds-next] BUILD SUCCESS
 f647a2266289a35eaa4865f629f2ab7046900d9b
Message-ID: <202607092233.3vJ3Y2W2-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git for-leds-next
branch HEAD: f647a2266289a35eaa4865f629f2ab7046900d9b  leds: lp5860-spi: Fix an error handling path

elapsed time: 789m

configs tested: 234
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-16.1.0
alpha                            allyesconfig    gcc-16.1.0
alpha                               defconfig    gcc-16.1.0
arc                              allmodconfig    clang-23
arc                              allmodconfig    gcc-16.1.0
arc                               allnoconfig    gcc-16.1.0
arc                              allyesconfig    clang-23
arc                              allyesconfig    gcc-16.1.0
arc                                 defconfig    gcc-16.1.0
arc                   randconfig-001-20260709    gcc-8.5.0
arc                   randconfig-002-20260709    gcc-8.5.0
arm                               allnoconfig    clang-17
arm                               allnoconfig    gcc-16.1.0
arm                              allyesconfig    clang-23
arm                              allyesconfig    gcc-16.1.0
arm                                 defconfig    gcc-16.1.0
arm                         nhk8815_defconfig    clang-23
arm                   randconfig-001-20260709    gcc-8.5.0
arm                   randconfig-002-20260709    gcc-8.5.0
arm                   randconfig-003-20260709    gcc-8.5.0
arm                   randconfig-004-20260709    gcc-8.5.0
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-16.1.0
arm64                               defconfig    gcc-16.1.0
arm64                 randconfig-001-20260709    gcc-16.1.0
arm64                 randconfig-002-20260709    gcc-16.1.0
arm64                 randconfig-003-20260709    gcc-16.1.0
arm64                 randconfig-004-20260709    gcc-16.1.0
csky                             allmodconfig    gcc-16.1.0
csky                              allnoconfig    gcc-16.1.0
csky                                defconfig    gcc-16.1.0
csky                  randconfig-001-20260709    gcc-16.1.0
csky                  randconfig-002-20260709    gcc-16.1.0
hexagon                          allmodconfig    clang-23
hexagon                          allmodconfig    gcc-16.1.0
hexagon                           allnoconfig    clang-23
hexagon                           allnoconfig    gcc-16.1.0
hexagon                             defconfig    gcc-16.1.0
hexagon               randconfig-001-20260709    clang-18
hexagon               randconfig-002-20260709    clang-18
i386                             allmodconfig    clang-22
i386                             allmodconfig    gcc-14
i386                              allnoconfig    gcc-14
i386                              allnoconfig    gcc-16.1.0
i386                             allyesconfig    clang-22
i386                             allyesconfig    gcc-14
i386        buildonly-randconfig-001-20260709    gcc-14
i386        buildonly-randconfig-002-20260709    gcc-14
i386        buildonly-randconfig-003-20260709    gcc-14
i386        buildonly-randconfig-004-20260709    gcc-14
i386        buildonly-randconfig-005-20260709    gcc-14
i386        buildonly-randconfig-006-20260709    gcc-14
i386                                defconfig    gcc-16.1.0
i386                  randconfig-001-20260709    gcc-14
i386                  randconfig-002-20260709    gcc-14
i386                  randconfig-003-20260709    gcc-14
i386                  randconfig-004-20260709    gcc-14
i386                  randconfig-005-20260709    gcc-14
i386                  randconfig-006-20260709    gcc-14
i386                  randconfig-007-20260709    gcc-14
i386                           randconfig-011    gcc-14
i386                  randconfig-011-20260709    clang-22
i386                  randconfig-011-20260709    gcc-14
i386                           randconfig-012    gcc-14
i386                  randconfig-012-20260709    gcc-14
i386                           randconfig-013    gcc-14
i386                  randconfig-013-20260709    clang-22
i386                  randconfig-013-20260709    gcc-14
i386                           randconfig-014    gcc-14
i386                  randconfig-014-20260709    gcc-14
i386                           randconfig-015    gcc-14
i386                  randconfig-015-20260709    clang-22
i386                  randconfig-015-20260709    gcc-14
i386                           randconfig-016    gcc-14
i386                  randconfig-016-20260709    clang-22
i386                  randconfig-016-20260709    gcc-14
i386                           randconfig-017    gcc-14
i386                  randconfig-017-20260709    gcc-14
loongarch                        allmodconfig    clang-19
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    clang-20
loongarch                         allnoconfig    gcc-16.1.0
loongarch                           defconfig    clang-23
loongarch             randconfig-001-20260709    clang-18
loongarch             randconfig-002-20260709    clang-18
m68k                             allmodconfig    gcc-16.1.0
m68k                              allnoconfig    gcc-16.1.0
m68k                             allyesconfig    clang-23
m68k                             allyesconfig    gcc-16.1.0
m68k                                defconfig    clang-23
m68k                      m54418evb_defconfig    gcc-16.1.0
microblaze                        allnoconfig    gcc-16.1.0
microblaze                       allyesconfig    gcc-16.1.0
microblaze                          defconfig    clang-23
mips                             allmodconfig    gcc-16.1.0
mips                              allnoconfig    gcc-16.1.0
mips                             allyesconfig    gcc-16.1.0
mips                      malta_kvm_defconfig    gcc-16.1.0
nios2                            allmodconfig    clang-20
nios2                            allmodconfig    gcc-11.5.0
nios2                             allnoconfig    clang-23
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-23
nios2                 randconfig-001-20260709    clang-18
nios2                 randconfig-002-20260709    clang-18
openrisc                         allmodconfig    clang-20
openrisc                         allmodconfig    gcc-16.1.0
openrisc                          allnoconfig    clang-23
openrisc                          allnoconfig    gcc-16.1.0
openrisc                            defconfig    gcc-16.1.0
parisc                           allmodconfig    gcc-16.1.0
parisc                            allnoconfig    clang-23
parisc                            allnoconfig    gcc-16.1.0
parisc                           allyesconfig    clang-17
parisc                           allyesconfig    gcc-16.1.0
parisc                              defconfig    gcc-16.1.0
parisc                randconfig-001-20260709    clang-23
parisc                randconfig-001-20260709    gcc-9.5.0
parisc                randconfig-002-20260709    clang-23
parisc                randconfig-002-20260709    gcc-8.5.0
parisc64                            defconfig    clang-23
powerpc                          allmodconfig    gcc-16.1.0
powerpc                           allnoconfig    clang-23
powerpc                           allnoconfig    gcc-16.1.0
powerpc                   microwatt_defconfig    gcc-16.1.0
powerpc               randconfig-001-20260709    clang-23
powerpc               randconfig-001-20260709    gcc-14.3.0
powerpc               randconfig-002-20260709    clang-23
powerpc64             randconfig-001-20260709    clang-19
powerpc64             randconfig-001-20260709    clang-23
powerpc64             randconfig-002-20260709    clang-23
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                             allnoconfig    gcc-16.1.0
riscv                            allyesconfig    clang-23
riscv                               defconfig    gcc-16.1.0
riscv                          randconfig-001    clang-22
riscv                 randconfig-001-20260709    clang-22
riscv                          randconfig-002    clang-22
riscv                 randconfig-002-20260709    clang-22
s390                             allmodconfig    clang-17
s390                             allmodconfig    clang-23
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-16.1.0
s390                                defconfig    gcc-16.1.0
s390                           randconfig-001    clang-22
s390                  randconfig-001-20260709    clang-22
s390                           randconfig-002    clang-22
s390                  randconfig-002-20260709    clang-22
sh                               allmodconfig    gcc-16.1.0
sh                                allnoconfig    clang-23
sh                                allnoconfig    gcc-16.1.0
sh                               allyesconfig    clang-17
sh                               allyesconfig    gcc-16.1.0
sh                                  defconfig    gcc-14
sh                             randconfig-001    clang-22
sh                    randconfig-001-20260709    clang-22
sh                             randconfig-002    clang-22
sh                    randconfig-002-20260709    clang-22
sparc                             allnoconfig    clang-23
sparc                             allnoconfig    gcc-16.1.0
sparc                               defconfig    gcc-16.1.0
sparc                 randconfig-001-20260709    gcc-8.5.0
sparc                 randconfig-002-20260709    gcc-8.5.0
sparc64                          allmodconfig    clang-20
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260709    gcc-8.5.0
sparc64               randconfig-002-20260709    gcc-8.5.0
um                               allmodconfig    clang-17
um                                allnoconfig    clang-17
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-14
um                               allyesconfig    gcc-16.1.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260709    gcc-8.5.0
um                    randconfig-002-20260709    gcc-8.5.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-22
x86_64                            allnoconfig    clang-22
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-22
x86_64      buildonly-randconfig-001-20260709    clang-22
x86_64      buildonly-randconfig-002-20260709    clang-22
x86_64      buildonly-randconfig-003-20260709    clang-22
x86_64      buildonly-randconfig-004-20260709    clang-22
x86_64      buildonly-randconfig-005-20260709    clang-22
x86_64      buildonly-randconfig-006-20260709    clang-22
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-22
x86_64                randconfig-001-20260709    gcc-14
x86_64                randconfig-002-20260709    gcc-14
x86_64                randconfig-003-20260709    gcc-14
x86_64                randconfig-004-20260709    gcc-14
x86_64                randconfig-005-20260709    gcc-14
x86_64                randconfig-006-20260709    gcc-14
x86_64                         randconfig-011    gcc-14
x86_64                randconfig-011-20260709    gcc-14
x86_64                         randconfig-012    gcc-14
x86_64                randconfig-012-20260709    gcc-14
x86_64                         randconfig-013    gcc-14
x86_64                randconfig-013-20260709    gcc-14
x86_64                         randconfig-014    gcc-14
x86_64                randconfig-014-20260709    gcc-14
x86_64                         randconfig-015    gcc-14
x86_64                randconfig-015-20260709    gcc-14
x86_64                         randconfig-016    gcc-14
x86_64                randconfig-016-20260709    gcc-14
x86_64                         randconfig-071    clang-22
x86_64                randconfig-071-20260709    clang-22
x86_64                         randconfig-072    clang-22
x86_64                randconfig-072-20260709    clang-22
x86_64                         randconfig-073    clang-22
x86_64                randconfig-073-20260709    clang-22
x86_64                         randconfig-074    clang-22
x86_64                randconfig-074-20260709    clang-22
x86_64                         randconfig-075    clang-22
x86_64                randconfig-075-20260709    clang-22
x86_64                         randconfig-076    clang-22
x86_64                randconfig-076-20260709    clang-22
x86_64                               rhel-9.4    clang-22
x86_64                           rhel-9.4-bpf    gcc-14
x86_64                          rhel-9.4-func    clang-22
x86_64                    rhel-9.4-kselftests    clang-22
x86_64                         rhel-9.4-kunit    gcc-14
x86_64                           rhel-9.4-ltp    gcc-14
x86_64                          rhel-9.4-rust    clang-22
xtensa                            allnoconfig    clang-23
xtensa                            allnoconfig    gcc-16.1.0
xtensa                           allyesconfig    clang-20
xtensa                           allyesconfig    gcc-16.1.0
xtensa                          iss_defconfig    gcc-16.1.0
xtensa                randconfig-001-20260709    gcc-8.5.0
xtensa                randconfig-002-20260709    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
