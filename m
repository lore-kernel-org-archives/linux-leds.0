Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2311337B00C
	for <linux-leds@vger.kernel.org>; Fri, 10 Jul 2026 18:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783708022; cv=none; b=PLbWGT49fTJ9tBsB8loKy+GyS5ht6NGkxY8H5gEHnQoygheIrVWpLFhshrHQQOodax8qSx31Tefm03FW+RaVW3EfjP79SivJLlpddmBAwQVAHH5jMQdd82SQtN5FN+8qaq0G9kTk9i0TPGu9h8y4pmGKh4gTMtcB/pwzC10F9m4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783708022; c=relaxed/simple;
	bh=zizXqSOqkkAZYIA2GmyLifcDK7IHLsSdZJTfaMX+aO8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=M5rVEbnemlJBRvNuHPlqpWtqh/AG1CBIWAnWUpc2A+HELYwfUxyrI4myqudv6fSCBiY6DoFyDS6X03/EQi1nUB9ZjVaYdDS4vaqBbJN4HTYiSXMEvjt3CzWiVk/fHLUhvEOxLPbdJqnOgIdTmVM1cx9KeIjq4SBLpsBfnyDduNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CcrJ2tXW; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CcrJ2tXW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783708020; x=1815244020;
  h=date:from:to:cc:subject:message-id;
  bh=zizXqSOqkkAZYIA2GmyLifcDK7IHLsSdZJTfaMX+aO8=;
  b=CcrJ2tXW8NndkBLSAT9WXd9DjMs98kY6h62Heis0MFsppfuF/ixYIT8n
   HtbY+rpa1+4y3OxGy7za9eyvu+HnfJLJJZAc0GhGBuelokyECIK3GMper
   v7Vwdo+v6fnQeb8ROtvwcHEx7IJsTfbmvAY31WKIzS2my5S5mv0IP90rM
   9B+WQ8O0ZC4JQuPidcm52SeqhgWZEVsWFWd75VLBUt8yCyWU2955KJ2kT
   kia0xRX2C9o9n6vGDoee5QCRue8WcqSc94K1DUOS7nMQwjcdG9JDSv6qz
   6AYak64g/+84PkcunqrJwPUVMAM8uTcwgDe55FLOCYvlnNjVtOtHnhGin
   Q==;
X-CSE-ConnectionGUID: 8cjDtsUPRyKhTZw5DuocwQ==
X-CSE-MsgGUID: LUfFYAyYS9yPV2V6kmz8cA==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="95925441"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="95925441"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2026 11:26:59 -0700
X-CSE-ConnectionGUID: 8FNnzPYZRjeef6BykG/Akg==
X-CSE-MsgGUID: 1gBddKD/Qu6qJ2v1YF40IA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="251580678"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 10 Jul 2026 11:26:57 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wiFw7-00000000JEf-2Pls;
	Fri, 10 Jul 2026 18:26:55 +0000
Date: Sat, 11 Jul 2026 02:26:10 +0800
From: kernel test robot <lkp@intel.com>
To: Lee Jones <lee@kernel.org>
Cc: linux-leds@vger.kernel.org
Subject: [lee-leds:for-leds-next] BUILD SUCCESS
 96fa4d69958cf90740d756d1e45cdb02cface41b
Message-ID: <202607110256.HBPUcIam-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git for-leds-next
branch HEAD: 96fa4d69958cf90740d756d1e45cdb02cface41b  leds: st1202: Correct and extend hw_pattern documentation

elapsed time: 747m

configs tested: 257
configs skipped: 7

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                             allnoconfig    gcc-16.1.0
alpha                            allyesconfig    gcc-16.1.0
alpha                               defconfig    gcc-16.1.0
arc                              allmodconfig    clang-23
arc                               allnoconfig    gcc-16.1.0
arc                              allyesconfig    clang-23
arc                                 defconfig    gcc-16.1.0
arc                            randconfig-001    clang-23
arc                   randconfig-001-20260710    clang-23
arc                            randconfig-002    clang-23
arc                   randconfig-002-20260710    clang-23
arm                               allnoconfig    gcc-16.1.0
arm                              allyesconfig    clang-23
arm                       aspeed_g5_defconfig    gcc-16.1.0
arm                                 defconfig    gcc-16.1.0
arm                            randconfig-001    clang-23
arm                   randconfig-001-20260710    clang-23
arm                            randconfig-002    clang-23
arm                   randconfig-002-20260710    clang-23
arm                            randconfig-003    clang-23
arm                   randconfig-003-20260710    clang-23
arm                            randconfig-004    clang-23
arm                   randconfig-004-20260710    clang-23
arm                          sp7021_defconfig    gcc-16.1.0
arm64                            allmodconfig    clang-23
arm64                             allnoconfig    gcc-16.1.0
arm64                               defconfig    gcc-16.1.0
arm64                          randconfig-001    clang-23
arm64                 randconfig-001-20260710    clang-23
arm64                 randconfig-001-20260710    gcc-10.5.0
arm64                          randconfig-002    clang-23
arm64                 randconfig-002-20260710    clang-23
arm64                 randconfig-002-20260710    gcc-10.5.0
arm64                          randconfig-003    clang-23
arm64                 randconfig-003-20260710    clang-23
arm64                 randconfig-003-20260710    gcc-10.5.0
arm64                          randconfig-004    clang-23
arm64                 randconfig-004-20260710    clang-23
arm64                 randconfig-004-20260710    gcc-10.5.0
csky                             allmodconfig    gcc-16.1.0
csky                              allnoconfig    gcc-16.1.0
csky                                defconfig    gcc-16.1.0
csky                           randconfig-001    clang-23
csky                  randconfig-001-20260710    clang-23
csky                  randconfig-001-20260710    gcc-10.5.0
csky                           randconfig-002    clang-23
csky                  randconfig-002-20260710    clang-23
csky                  randconfig-002-20260710    gcc-10.5.0
hexagon                          allmodconfig    gcc-16.1.0
hexagon                           allnoconfig    gcc-16.1.0
hexagon                             defconfig    gcc-16.1.0
hexagon               randconfig-001-20260710    gcc-12.5.0
hexagon               randconfig-002-20260710    gcc-12.5.0
i386                             allmodconfig    clang-22
i386                              allnoconfig    gcc-16.1.0
i386                             allyesconfig    clang-22
i386                 buildonly-randconfig-001    clang-22
i386        buildonly-randconfig-001-20260710    clang-22
i386                 buildonly-randconfig-002    clang-22
i386        buildonly-randconfig-002-20260710    clang-22
i386                 buildonly-randconfig-003    clang-22
i386        buildonly-randconfig-003-20260710    clang-22
i386                 buildonly-randconfig-004    clang-22
i386        buildonly-randconfig-004-20260710    clang-22
i386                 buildonly-randconfig-005    clang-22
i386        buildonly-randconfig-005-20260710    clang-22
i386                 buildonly-randconfig-006    clang-22
i386        buildonly-randconfig-006-20260710    clang-22
i386                                defconfig    gcc-16.1.0
i386                  randconfig-001-20260710    clang-22
i386                  randconfig-002-20260710    clang-22
i386                  randconfig-003-20260710    clang-22
i386                  randconfig-004-20260710    clang-22
i386                  randconfig-005-20260710    clang-22
i386                  randconfig-006-20260710    clang-22
i386                  randconfig-007-20260710    clang-22
i386                           randconfig-011    gcc-14
i386                  randconfig-011-20260710    gcc-14
i386                           randconfig-012    gcc-14
i386                  randconfig-012-20260710    gcc-14
i386                           randconfig-013    gcc-14
i386                  randconfig-013-20260710    gcc-14
i386                           randconfig-014    gcc-14
i386                  randconfig-014-20260710    gcc-14
i386                           randconfig-015    gcc-14
i386                  randconfig-015-20260710    gcc-14
i386                           randconfig-016    gcc-14
i386                  randconfig-016-20260710    gcc-14
i386                           randconfig-017    gcc-14
i386                  randconfig-017-20260710    gcc-14
loongarch                        allmodconfig    clang-23
loongarch                         allnoconfig    gcc-16.1.0
loongarch                           defconfig    clang-23
loongarch             randconfig-001-20260710    gcc-12.5.0
loongarch             randconfig-002-20260710    gcc-12.5.0
m68k                             allmodconfig    gcc-16.1.0
m68k                              allnoconfig    gcc-16.1.0
m68k                             allyesconfig    clang-23
m68k                                defconfig    clang-23
microblaze                        allnoconfig    gcc-16.1.0
microblaze                       allyesconfig    gcc-16.1.0
microblaze                          defconfig    clang-23
mips                             allmodconfig    gcc-16.1.0
mips                              allnoconfig    gcc-16.1.0
mips                             allyesconfig    gcc-16.1.0
nios2                            allmodconfig    clang-20
nios2                             allnoconfig    clang-23
nios2                             allnoconfig    gcc-11.5.0
nios2                               defconfig    clang-23
nios2                 randconfig-001-20260710    gcc-12.5.0
nios2                 randconfig-002-20260710    gcc-12.5.0
openrisc                         allmodconfig    clang-20
openrisc                          allnoconfig    clang-23
openrisc                          allnoconfig    gcc-16.1.0
openrisc                            defconfig    gcc-16.1.0
parisc                           allmodconfig    gcc-16.1.0
parisc                            allnoconfig    clang-23
parisc                            allnoconfig    gcc-16.1.0
parisc                           allyesconfig    clang-17
parisc                              defconfig    gcc-16.1.0
parisc                         randconfig-001    clang-17
parisc                randconfig-001-20260710    clang-17
parisc                         randconfig-002    clang-17
parisc                randconfig-002-20260710    clang-17
parisc64                            defconfig    clang-23
powerpc                          allmodconfig    gcc-16.1.0
powerpc                           allnoconfig    clang-23
powerpc                           allnoconfig    gcc-16.1.0
powerpc                       eiger_defconfig    clang-23
powerpc                 mpc836x_rdk_defconfig    clang-23
powerpc                     mpc83xx_defconfig    clang-21
powerpc                        randconfig-001    clang-17
powerpc               randconfig-001-20260710    clang-17
powerpc                        randconfig-002    clang-17
powerpc               randconfig-002-20260710    clang-17
powerpc64                      randconfig-001    clang-17
powerpc64             randconfig-001-20260710    clang-17
powerpc64                      randconfig-002    clang-17
powerpc64             randconfig-002-20260710    clang-17
riscv                            allmodconfig    clang-23
riscv                             allnoconfig    clang-23
riscv                             allnoconfig    gcc-16.1.0
riscv                            allyesconfig    clang-23
riscv                               defconfig    gcc-16.1.0
riscv                          randconfig-001    clang-17
riscv                 randconfig-001-20260710    clang-17
riscv                          randconfig-002    clang-17
riscv                 randconfig-002-20260710    clang-17
s390                             allmodconfig    clang-17
s390                              allnoconfig    clang-23
s390                             allyesconfig    gcc-16.1.0
s390                                defconfig    gcc-16.1.0
s390                           randconfig-001    clang-17
s390                  randconfig-001-20260710    clang-17
s390                           randconfig-002    clang-17
s390                  randconfig-002-20260710    clang-17
sh                               allmodconfig    gcc-16.1.0
sh                                allnoconfig    clang-23
sh                                allnoconfig    gcc-16.1.0
sh                               allyesconfig    clang-17
sh                                  defconfig    gcc-14
sh                             randconfig-001    clang-17
sh                    randconfig-001-20260710    clang-17
sh                             randconfig-002    clang-17
sh                    randconfig-002-20260710    clang-17
sh                   sh7724_generic_defconfig    gcc-16.1.0
sparc                             allnoconfig    clang-23
sparc                             allnoconfig    gcc-16.1.0
sparc                               defconfig    gcc-16.1.0
sparc                 randconfig-001-20260710    gcc-15.2.0
sparc                 randconfig-002-20260710    gcc-15.2.0
sparc64                          allmodconfig    clang-20
sparc64                             defconfig    gcc-14
sparc64               randconfig-001-20260710    gcc-15.2.0
sparc64               randconfig-002-20260710    gcc-15.2.0
um                               allmodconfig    clang-17
um                                allnoconfig    clang-17
um                                allnoconfig    clang-23
um                               allyesconfig    gcc-16.1.0
um                                  defconfig    gcc-14
um                             i386_defconfig    gcc-14
um                    randconfig-001-20260710    gcc-15.2.0
um                    randconfig-002-20260710    gcc-15.2.0
um                           x86_64_defconfig    gcc-14
x86_64                           allmodconfig    clang-22
x86_64                            allnoconfig    clang-22
x86_64                            allnoconfig    clang-23
x86_64                           allyesconfig    clang-22
x86_64               buildonly-randconfig-001    clang-22
x86_64      buildonly-randconfig-001-20260710    clang-22
x86_64               buildonly-randconfig-002    clang-22
x86_64      buildonly-randconfig-002-20260710    clang-22
x86_64               buildonly-randconfig-003    clang-22
x86_64      buildonly-randconfig-003-20260710    clang-22
x86_64               buildonly-randconfig-004    clang-22
x86_64      buildonly-randconfig-004-20260710    clang-22
x86_64               buildonly-randconfig-005    clang-22
x86_64      buildonly-randconfig-005-20260710    clang-22
x86_64               buildonly-randconfig-006    clang-22
x86_64      buildonly-randconfig-006-20260710    clang-22
x86_64                              defconfig    gcc-14
x86_64                                  kexec    clang-22
x86_64                         randconfig-001    clang-22
x86_64                randconfig-001-20260710    clang-22
x86_64                randconfig-001-20260710    gcc-14
x86_64                         randconfig-002    clang-22
x86_64                randconfig-002-20260710    clang-22
x86_64                randconfig-002-20260710    gcc-14
x86_64                         randconfig-003    clang-22
x86_64                randconfig-003-20260710    clang-22
x86_64                randconfig-003-20260710    gcc-14
x86_64                         randconfig-004    clang-22
x86_64                randconfig-004-20260710    clang-22
x86_64                randconfig-004-20260710    gcc-14
x86_64                         randconfig-005    clang-22
x86_64                randconfig-005-20260710    clang-22
x86_64                randconfig-005-20260710    gcc-14
x86_64                         randconfig-006    clang-22
x86_64                randconfig-006-20260710    clang-22
x86_64                randconfig-006-20260710    gcc-14
x86_64                         randconfig-011    gcc-14
x86_64                randconfig-011-20260710    clang-22
x86_64                randconfig-011-20260710    gcc-14
x86_64                         randconfig-012    gcc-14
x86_64                randconfig-012-20260710    clang-22
x86_64                randconfig-012-20260710    gcc-14
x86_64                randconfig-013-20260710    clang-22
x86_64                         randconfig-014    gcc-14
x86_64                randconfig-014-20260710    clang-22
x86_64                         randconfig-015    gcc-14
x86_64                randconfig-015-20260710    clang-22
x86_64                randconfig-015-20260710    gcc-14
x86_64                randconfig-016-20260710    clang-22
x86_64                         randconfig-071    gcc-14
x86_64                randconfig-071-20260710    gcc-14
x86_64                         randconfig-072    gcc-14
x86_64                randconfig-072-20260710    gcc-14
x86_64                         randconfig-073    gcc-14
x86_64                randconfig-073-20260710    gcc-14
x86_64                         randconfig-074    gcc-14
x86_64                randconfig-074-20260710    gcc-14
x86_64                         randconfig-075    gcc-14
x86_64                randconfig-075-20260710    gcc-14
x86_64                         randconfig-076    gcc-14
x86_64                randconfig-076-20260710    gcc-14
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
xtensa                randconfig-001-20260710    gcc-15.2.0
xtensa                randconfig-002-20260710    gcc-15.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
