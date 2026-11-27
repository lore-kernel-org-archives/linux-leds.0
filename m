Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795777835;
	b=EqxyC7u0umrkj5rE/WOYD1k0fpdZf5ClwC+WbQtpqpdP9BZ4GxCRXRUdZuXJL4mODaw3
	 N4q0VRejpspXnu80dQHkwmRWmjPrEoGRamXW2wCm1BgQMiCWnG55+gYfsrGifD2nizr80
	 GzLt9SxdmIs/jVE0DdbnMvboAUaPzejxu1kBaFtCYdpDAE7EfIpyBIehYgUsaHJR9ShRT
	 9nH8Lkwp1GzDvD8u0+17C7Up9tjMlroZfvuLdOksBO+FWT4EiWB9vDag1hjGdzr4yt4xw
	 /pvnJcVXHWc+7yTUduNhHqTo2HDwOl7pV5NMmgB79Ne/5auTnEogqdrxwiMdaxmcO3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795777835;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=YcreOiw1dZR1M4cUX5La/Y3+W+OnabKK90wdM+O96io=;
	b=Ax3gbHHQgC201K/P2eXXUY6ePSEXwn1/Y839VqIEldUoP9KoSOz7XT9sgl0NKNHNVrgA
	 a4WDDS8SH8MyuNGF2GOCY8qgoZ8AvP9jveqdg11aH+bcCP+7nIeYg5Dlat5UKMFygCRDF
	 /YWBuW9//uYp+NSu0BeB336v3dlSKUjvcV5y7mBKziZxXE5wBA8uQ5gKDqi3EJpfyWbKM
	 dg8s5jFg0u9exTnnsMiES2ofbixbjC8rmUwrgroeixT36U9yvvNj+V4tRBgtcHjs5jmD7
	 wKB9cr0Ao+oGrEjGu5/EPCJCmf/2GuiJELUaszNPRw/uEBsvOdEoUwFWe24nhgBSUNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XueWVUG7;
	arc=none smtp.remote-ip=192.198.163.7
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA301606A31C
	for <linux-leds@vger.kernel.org>; Fri, 27 Nov 2026 11:10:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA301606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XueWVUG7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795777835; x=1827313835;
  h=date:from:to:cc:subject:message-id;
  bh=ZYL4Zr64njS8CJaNH8JbpQJrnULMsAm1DQ/9dyXVrFM=;
  b=XueWVUG7tpOTEAxbSYDRHFR4Q4mUAOP+bQUD9qJHmPTeDlvYV9hL16PX
   4h1Imh8es/KRViXCwYUmfBxU+9NTsGsYb5ftjctkefdTNHIhOJMy7ldPk
   sl98Mc2zp1fvBJyjKC5wZbMFKiKIFFUqQdemnfVCE/+GyOCxQS4rPXYbu
   9KxJVes+/C1PlCb6p8Nr4C+V/jYXl62SZgGtNTIRqaz0/8Da/lGHrtI+Q
   8DB5EkHlzkJNbwfWzJbx4yofCnIa2AuMYVEuREeOSFInP5srQiJDNJ/AA
   wNqTK2WSvF6C3PJHgnL3Xl6QqKStEYmxivsREir6hq7/AeKTeC/FM+045
   g==;
X-CSE-ConnectionGUID: OhEWYt9iQh2my5UcM8O2OQ==
X-CSE-MsgGUID: IkfozcNqQda2/W9iKYu4Ew==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4532574"
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; 
   d="scan'208";a="4532574"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2026 03:10:34 -0800
X-CSE-ConnectionGUID: uAVXc8IGRUGzOoe4ZoI6mQ==
X-CSE-MsgGUID: gFh5jfheToiu8k4bzQ8ptg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; 
   d="scan'208";a="12158521"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 27 Nov 2026 03:10:33 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xWtqY-00000001VwY-28Fm;
	Fri, 27 Nov 2026 11:10:30 +0000
Date: Fri, 27 Nov 2026 19:09:33 +0800
From: kernel test robot <lkp@intel.com>
To: Lee Jones <lee@kernel.org>
Cc: linux-leds@vger.kernel.org
Subject: [lee-leds:for-leds-next] BUILD SUCCESS
 7c804d7bde4a002a676509df6d1474f1d2a2434e
Message-ID: <20261127190933.vCYI3Ly2-lkp@intel.com>
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
branch HEAD: 7c804d7bde4a002a676509df6d1474f1d2a2434e  leds: Add driver for MAX8907 LED cell

elapsed time: 901m

configs tested: 306
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                              allnoconfig    gcc-16.2.0
alpha                             allyesconfig    gcc-16.2.0
alpha                                defconfig    gcc-16.2.0
alpha                 randconfig-2200-20261126    gcc-9.5.0  smatch
arc                               allmodconfig    clang-24
arc                                allnoconfig    gcc-16.2.0
arc                               allyesconfig    clang-24
arc                                  defconfig    gcc-16.2.0
arc                      nsimosci_hs_defconfig    gcc-16.2.0
arc                   randconfig-1000-20261127    gcc-8.5.0
arc                   randconfig-1001-20261127    gcc-8.5.0
arc                   randconfig-2000-20261126    gcc-11.5.0
arc                   randconfig-2001-20261126    gcc-8.5.0
arc                   randconfig-2002-20261126    gcc-8.5.0
arc                   randconfig-2003-20261126    gcc-9.5.0
arc                   randconfig-2004-20261126    gcc-15.3.0
arc                   randconfig-2005-20261126    gcc-9.5.0
arc                   randconfig-2200-20261126    gcc-8.5.0  smatch
arc                  randconfig-r2110-20261126    gcc-8.5.0  cocci
arc                  randconfig-r2305-20261127    gcc-9.5.0  sparse
arm                                allnoconfig    gcc-16.2.0
arm                               allyesconfig    clang-24
arm                      am200epdkit_defconfig    gcc-16.2.0
arm                                  defconfig    gcc-16.2.0
arm                             dove_defconfig    gcc-16.2.0
arm                    milbeaut_m10v_defconfig    gcc-16.2.0
arm                   randconfig-1000-20261127    gcc-8.5.0
arm                   randconfig-1001-20261127    gcc-8.5.0
arm                   randconfig-1002-20261127    gcc-8.5.0
arm                   randconfig-1003-20261127    gcc-8.5.0
arm                   randconfig-2000-20261126    gcc-8.5.0
arm                   randconfig-2001-20261126    gcc-11.5.0
arm                   randconfig-2002-20261126    gcc-13.5.0
arm                   randconfig-2200-20261126    gcc-8.5.0  smatch
arm                  randconfig-r2101-20261126    gcc-14.4.0 cocci
arm                  randconfig-r2300-20261127    clang-24   sparse
arm                  randconfig-r2301-20261127    gcc-10.5.0 sparse
arm                         realview_defconfig    gcc-16.2.0
arm                          s5pv210_defconfig    gcc-16.2.0
arm                         vexpress_defconfig    gcc-16.2.0
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.2.0
arm64                                defconfig    gcc-16.2.0
arm64                 randconfig-1000-20261127    gcc-8.5.0
arm64                 randconfig-1001-20261127    gcc-8.5.0
arm64                 randconfig-1002-20261127    gcc-8.5.0
arm64                 randconfig-1003-20261127    gcc-8.5.0
arm64                 randconfig-2000-20261126    clang-24
arm64                 randconfig-2001-20261126    clang-20
arm64                 randconfig-2002-20261126    clang-24
arm64                 randconfig-2200-20261126    clang-24   smatch
csky                              allmodconfig    gcc-16.2.0
csky                               allnoconfig    gcc-16.2.0
csky                                 defconfig    gcc-16.2.0
csky                  randconfig-1000-20261127    gcc-8.5.0
csky                  randconfig-1001-20261127    gcc-8.5.0
csky                  randconfig-2000-20261126    gcc-16.2.0
csky                  randconfig-2001-20261126    gcc-13.5.0
csky                  randconfig-2200-20261126    gcc-13.5.0 smatch
hexagon                           allmodconfig    gcc-16.2.0
hexagon                            allnoconfig    gcc-16.2.0
hexagon                              defconfig    gcc-16.2.0
hexagon               randconfig-1000-20261127    gcc-9.5.0
hexagon               randconfig-1001-20261127    gcc-9.5.0
hexagon               randconfig-2000-20261126    clang-24
hexagon               randconfig-2001-20261126    clang-17
hexagon               randconfig-2200-20261127    clang-24   smatch
i386                              allmodconfig    clang-22
i386                               allnoconfig    gcc-16.2.0
i386                              allyesconfig    clang-22
i386        buildonly-randconfig-1000-20261127    clang-22
i386        buildonly-randconfig-1001-20261127    clang-22
i386        buildonly-randconfig-1002-20261127    clang-22
i386        buildonly-randconfig-1003-20261127    clang-22
i386        buildonly-randconfig-1004-20261127    clang-22
i386        buildonly-randconfig-1005-20261127    clang-22
i386                                 defconfig    gcc-16.2.0
i386                  randconfig-1000-20261127    clang-22
i386                  randconfig-1001-20261127    clang-22
i386                  randconfig-1002-20261127    clang-22
i386                  randconfig-1003-20261127    clang-22
i386                  randconfig-1004-20261127    clang-22
i386                  randconfig-1005-20261127    clang-22
i386                  randconfig-1006-20261127    clang-22
i386                  randconfig-2000-20261126    clang-22
i386                  randconfig-2001-20261126    clang-22
i386                  randconfig-2002-20261126    clang-22
i386                  randconfig-2003-20261126    gcc-14
i386                  randconfig-2004-20261126    clang-22
i386                  randconfig-2005-20261126    clang-22
i386                  randconfig-2200-20261126    gcc-14     smatch
i386                  randconfig-2300-20261126    gcc-14     sparse
i386                  randconfig-2300-20261127    clang-22   sparse
i386                  randconfig-2301-20261127    gcc-14     sparse
i386                  randconfig-2302-20261127    clang-22   sparse
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    gcc-16.2.0
loongarch                            defconfig    clang-24
loongarch             randconfig-1000-20261127    gcc-9.5.0
loongarch             randconfig-1001-20261127    gcc-9.5.0
loongarch             randconfig-2000-20261126    gcc-12.5.0
loongarch             randconfig-2001-20261126    clang-18
loongarch             randconfig-2200-20261126    gcc-14.4.0 smatch
loongarch            randconfig-r2105-20261126    clang-24   cocci
m68k                              allmodconfig    gcc-16.2.0
m68k                               allnoconfig    gcc-16.2.0
m68k                              allyesconfig    clang-24
m68k                                 defconfig    clang-24
m68k                         m5407c3_defconfig    gcc-16.2.0
m68k                             q40_defconfig    gcc-16.2.0
m68k                  randconfig-2200-20261126    gcc-8.5.0  smatch
microblaze                         allnoconfig    gcc-16.2.0
microblaze                        allyesconfig    gcc-16.2.0
microblaze                           defconfig    clang-24
microblaze            randconfig-2200-20261126    gcc-9.5.0  smatch
microblaze           randconfig-r2104-20261126    gcc-11.5.0 cocci
mips                              allmodconfig    gcc-16.2.0
mips                               allnoconfig    gcc-16.2.0
mips                              allyesconfig    gcc-16.2.0
mips                        bmips_be_defconfig    gcc-16.2.0
mips                      decstation_defconfig    gcc-16.2.0
mips                  decstation_r4k_defconfig    gcc-16.2.0
mips                             gpr_defconfig    gcc-16.2.0
mips                            ip27_defconfig    gcc-16.2.0
mips                            ip30_defconfig    gcc-16.2.0
mips                         maltaup_defconfig    gcc-16.2.0
mips                  randconfig-2000-20261126    gcc-8.5.0
mips                  randconfig-2001-20261126    gcc-15.3.0
mips                  randconfig-2002-20261126    gcc-9.5.0
mips                  randconfig-2200-20261126    gcc-15.3.0 smatch
nios2                             alldefconfig    gcc-16.2.0
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20261127    gcc-9.5.0
nios2                 randconfig-1001-20261127    gcc-9.5.0
nios2                 randconfig-2000-20261126    gcc-11.5.0
nios2                 randconfig-2001-20261126    gcc-9.5.0
nios2                 randconfig-2200-20261126    gcc-9.5.0  smatch
nios2                randconfig-r2304-20261127    gcc-11.5.0 sparse
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc                             defconfig    gcc-16.2.0
openrisc              randconfig-2000-20261126    gcc-16.2.0
openrisc              randconfig-2001-20261126    gcc-13.5.0
openrisc              randconfig-2002-20261126    gcc-16.2.0
openrisc              randconfig-2200-20261126    gcc-9.5.0  smatch
parisc                            allmodconfig    gcc-16.2.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.2.0
parisc                 generic-32bit_defconfig    gcc-16.2.0
parisc                randconfig-1000-20261127    gcc-12.5.0
parisc                randconfig-1001-20261127    gcc-12.5.0
parisc                randconfig-2000-20261126    gcc-8.5.0
parisc                randconfig-2001-20261126    gcc-8.5.0
parisc                randconfig-2200-20261126    gcc-15.3.0 smatch
parisc               randconfig-r2108-20261126    gcc-10.5.0 cocci
parisc               randconfig-r2109-20261126    gcc-16.2.0 cocci
parisc64                             defconfig    clang-24
powerpc                           allmodconfig    gcc-16.2.0
powerpc                            allnoconfig    clang-24
powerpc                    bluestone_defconfig    gcc-16.2.0
powerpc                      ksi8560_defconfig    gcc-16.2.0
powerpc                      mpc512x_defconfig    gcc-16.2.0
powerpc                  mpc834x_itx_defconfig    gcc-16.2.0
powerpc                          ps3_defconfig    gcc-16.2.0
powerpc               randconfig-1000-20261127    gcc-12.5.0
powerpc               randconfig-1001-20261127    gcc-12.5.0
powerpc               randconfig-2000-20261126    clang-24
powerpc               randconfig-2001-20261126    clang-17
powerpc               randconfig-2002-20261126    clang-24
powerpc               randconfig-2200-20261126    clang-24   smatch
powerpc              randconfig-r2107-20261126    gcc-8.5.0  cocci
powerpc              randconfig-r2302-20261127    clang-24   sparse
powerpc                          wii_defconfig    gcc-16.2.0
powerpc64             randconfig-1000-20261127    gcc-12.5.0
powerpc64             randconfig-1001-20261127    gcc-12.5.0
powerpc64             randconfig-2000-20261126    clang-17
powerpc64             randconfig-2001-20261126    gcc-10.5.0
powerpc64             randconfig-2002-20261126    clang-21
powerpc64             randconfig-2200-20261126    clang-24   smatch
powerpc64            randconfig-r2305-20261127    clang-20   sparse
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.2.0
riscv                     nommu_k210_defconfig    gcc-16.2.0
riscv                 randconfig-2000-20261126    gcc-10.5.0
riscv                 randconfig-2001-20261126    clang-24
riscv                 randconfig-2002-20261126    clang-20
riscv                 randconfig-2003-20261126    gcc-16.2.0
riscv                 randconfig-2004-20261126    gcc-10.5.0
riscv                 randconfig-2005-20261126    clang-24
riscv                 randconfig-2200-20261126    gcc-8.5.0  smatch
riscv                randconfig-r2111-20261127    clang-17   cocci
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.2.0
s390                                 defconfig    gcc-16.2.0
s390                  randconfig-2000-20261126    clang-18
s390                  randconfig-2001-20261126    gcc-8.5.0
s390                  randconfig-2002-20261126    clang-24
s390                  randconfig-2003-20261126    clang-18
s390                  randconfig-2004-20261126    gcc-10.5.0
s390                  randconfig-2005-20261126    clang-21
s390                  randconfig-2200-20261126    gcc-16.2.0 smatch
s390                 randconfig-r2111-20261126    gcc-15.3.0 cocci
sh                                allmodconfig    gcc-16.2.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                                   defconfig    gcc-14
sh                         dreamcast_defconfig    gcc-16.2.0
sh                         edosk7705_defconfig    gcc-16.2.0
sh                           polaris_defconfig    gcc-16.2.0
sh                    randconfig-2000-20261126    gcc-16.2.0
sh                    randconfig-2001-20261126    gcc-13.5.0
sh                    randconfig-2002-20261126    gcc-11.5.0
sh                    randconfig-2003-20261126    gcc-9.5.0
sh                    randconfig-2004-20261126    gcc-16.2.0
sh                    randconfig-2005-20261126    gcc-16.2.0
sh                    randconfig-2200-20261126    gcc-16.2.0 smatch
sh                           rsk7264_defconfig    gcc-16.2.0
sh                         sh7757lcr_defconfig    gcc-16.2.0
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.2.0
sparc                 randconfig-1000-20261127    gcc-14
sparc                 randconfig-1001-20261127    gcc-14
sparc                 randconfig-2000-20261127    gcc-8.5.0
sparc                 randconfig-2001-20261127    gcc-8.5.0
sparc                 randconfig-2200-20261126    gcc-13.5.0 smatch
sparc                randconfig-r2103-20261126    gcc-13.5.0 cocci
sparc                randconfig-r2106-20261127    gcc-14.4.0 cocci
sparc                randconfig-r2310-20261126    gcc-8.5.0  sparse
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20261127    gcc-14
sparc64               randconfig-1001-20261127    gcc-14
sparc64               randconfig-2000-20261127    clang-24
sparc64               randconfig-2001-20261127    gcc-13.5.0
sparc64               randconfig-2200-20261126    gcc-12.5.0 smatch
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.2.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20261127    gcc-14
um                    randconfig-1001-20261127    gcc-14
um                    randconfig-2000-20261127    gcc-13
um                    randconfig-2001-20261127    clang-24
um                    randconfig-2200-20261126    gcc-12     smatch
um                   randconfig-r2100-20261126    clang-24   cocci
um                   randconfig-r2301-20261126    gcc-13     sparse
um                            x86_64_defconfig    gcc-14
x86_64                            allmodconfig    clang-22
x86_64                             allnoconfig    clang-24
x86_64                            allyesconfig    clang-22
x86_64      buildonly-randconfig-1000-20261127    gcc-14
x86_64      buildonly-randconfig-1001-20261127    gcc-14
x86_64      buildonly-randconfig-1002-20261127    gcc-14
x86_64      buildonly-randconfig-1003-20261127    gcc-14
x86_64      buildonly-randconfig-1004-20261127    gcc-14
x86_64      buildonly-randconfig-1005-20261127    gcc-14
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20261127    gcc-14
x86_64                randconfig-1001-20261127    gcc-14
x86_64                randconfig-1002-20261127    gcc-14
x86_64                randconfig-1003-20261127    gcc-14
x86_64                randconfig-1004-20261127    gcc-14
x86_64                randconfig-1005-20261127    gcc-14
x86_64                randconfig-2000-20261126    clang-22
x86_64                randconfig-2001-20261126    gcc-14
x86_64                randconfig-2002-20261126    clang-22
x86_64                randconfig-2003-20261126    clang-22
x86_64                randconfig-2004-20261126    clang-22
x86_64                randconfig-2005-20261126    clang-22
x86_64                randconfig-2100-20261127    clang-22   cocci
x86_64                randconfig-2101-20261127    gcc-14     cocci
x86_64                randconfig-2102-20261127    clang-22   cocci
x86_64                randconfig-2103-20261127    gcc-14     cocci
x86_64                randconfig-2104-20261127    clang-22   cocci
x86_64                randconfig-2105-20261127    clang-22   cocci
x86_64                randconfig-2200-20261126    clang-22   smatch
x86_64                randconfig-2300-20261127    clang-22   sparse
x86_64                randconfig-2301-20261126    gcc-14     sparse
x86_64                randconfig-2301-20261127    gcc-13     sparse
x86_64                randconfig-2302-20261126    gcc-14     sparse
x86_64                randconfig-2302-20261127    clang-22   sparse
x86_64               randconfig-r2102-20261126    clang-22   cocci
x86_64               randconfig-r2303-20261127    gcc-14     sparse
x86_64                                rhel-9.4    clang-22
x86_64                            rhel-9.4-bpf    gcc-14
x86_64                           rhel-9.4-func    clang-22
x86_64                     rhel-9.4-kselftests    clang-22
x86_64                          rhel-9.4-kunit    gcc-14
x86_64                            rhel-9.4-ltp    gcc-14
x86_64                           rhel-9.4-rust    clang-22
xtensa                             allnoconfig    clang-24
xtensa                            allyesconfig    clang-20
xtensa                        common_defconfig    gcc-16.2.0
xtensa                randconfig-1000-20261127    gcc-14
xtensa                randconfig-1001-20261127    gcc-14
xtensa                randconfig-2000-20261126    gcc-13.5.0
xtensa                randconfig-2001-20261126    gcc-15.3.0
xtensa                randconfig-2200-20261126    gcc-11.5.0 smatch

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
