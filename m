Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F09253B6363
	for <linux-leds@vger.kernel.org>; Sat,  8 Aug 2026 09:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786180334; cv=none; b=VyiOar+Q8zI8W/JXA86BoQrqnrDQcWKOQdCdE5rCxUDXxObR/1tqFCp55erHG6sMrTsyl+HKPaCftrYskAdIGkBpUm4jKJ4hHQwZ31Ya4vxffVJUFyEsXiVJV45SK/U3NA+H0wM7guesdePK6902KEpSX5hJO0d1aUlrWRddTcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786180334; c=relaxed/simple;
	bh=p3GNSCIxKZ4cODnbNsZevdLSfzqd1qdcbUSj5EfFFXo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FwQIfFWoi96cKzjzdL/9ImndhYlQqncDBR+yVIcWNUIt9SVbhMz6JvgP5oS9ZmRGY2jrBc4h7q+puyg8kS34NRMTuURLHOLGzZgp1Hx54T9h3uz3yIX8Gf8VQntyYGtwFsm/mUtXmWvP67cmX9MtchwWFkaxfOHCnzQrl+O06iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SY/t1qEl; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SY/t1qEl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786180331; x=1817716331;
  h=date:from:to:cc:subject:message-id;
  bh=p3GNSCIxKZ4cODnbNsZevdLSfzqd1qdcbUSj5EfFFXo=;
  b=SY/t1qElEIe1BBRTxkLbICNVtv4J5UR2U3KhAa6vpdp+MfXm/xW1vK1p
   Nyajdnyf9scwYw8U9pPmMbCe4jNW7JONHd+wG/NOwOwE1TXE7JD5g+W9V
   vfXktxurmNV4vuVDx3y+MEVrk5urLA0Ry8GRarXiNrGk86lL0/voe//bD
   lRI4VvslRQevn8X+q4kR0ycvspmpsjUIJqkQbQTv95PQpLIjZ0o/sYxE8
   7TH4iQaucEKXpRR19rT3EopkUXeRrxqagIq8iPXRSYN4JBHIpYQyKdVHe
   ZrLE2QINkKz/06Q+inQLePIUQFXiHCZSwBT4xKVExgqt9m/vd2JISZ/N/
   g==;
X-CSE-ConnectionGUID: jHUTlS2+RsaU+EXcEAHlsQ==
X-CSE-MsgGUID: izIujiDcRuyvUhhohJoUlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11868"; a="90590662"
X-IronPort-AV: E=Sophos;i="6.25,211,1779174000"; 
   d="scan'208";a="90590662"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2026 02:12:09 -0700
X-CSE-ConnectionGUID: pUeIBjAPTza6P6Rs7tyN8A==
X-CSE-MsgGUID: ZkigIQ/8QPm062JhCQLOcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,211,1779174000"; 
   d="scan'208";a="267769268"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 08 Aug 2026 02:12:08 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wsd65-00000000K2D-44ES;
	Sat, 08 Aug 2026 09:12:05 +0000
Date: Sat, 08 Aug 2026 17:11:11 +0800
From: kernel test robot <lkp@intel.com>
To: Lee Jones <lee@kernel.org>
Cc: linux-leds@vger.kernel.org
Subject: [lee-leds:for-leds-next] BUILD SUCCESS
 e36f8825616b73a09cd2308f2644aa12d7fb6db0
Message-ID: <202608081752.CToObewv-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git for-leds-next
branch HEAD: e36f8825616b73a09cd2308f2644aa12d7fb6db0  dt-bindings: leds: lacie,ns2-leds: Convert to DT schema

elapsed time: 2504m

configs tested: 162
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                            allnoconfig    gcc-16.1.0
alpha                           allyesconfig    gcc-16.1.0
alpha                              defconfig    gcc-16.1.0
arc                             alldefconfig    gcc-16.1.0
arc                             allmodconfig    gcc-16.1.0
arc                             allyesconfig    gcc-16.1.0
arc                  randconfig-001-20260807    gcc-14.3.0
arc                  randconfig-001-20260808    gcc-9.5.0
arc                  randconfig-002-20260807    gcc-14.3.0
arc                  randconfig-002-20260808    gcc-9.5.0
arm                  randconfig-001-20260807    gcc-14.3.0
arm                  randconfig-001-20260808    gcc-9.5.0
arm                  randconfig-002-20260807    gcc-14.3.0
arm                  randconfig-002-20260808    gcc-9.5.0
arm                  randconfig-003-20260807    gcc-14.3.0
arm                  randconfig-003-20260808    gcc-9.5.0
arm                  randconfig-004-20260807    gcc-14.3.0
arm                  randconfig-004-20260808    gcc-9.5.0
arm64                randconfig-001-20260807    gcc-16.1.0
arm64                randconfig-001-20260808    gcc-11.5.0
arm64                randconfig-002-20260807    gcc-16.1.0
arm64                randconfig-002-20260808    gcc-11.5.0
arm64                randconfig-003-20260807    gcc-16.1.0
arm64                randconfig-003-20260808    gcc-11.5.0
arm64                randconfig-004-20260807    gcc-16.1.0
arm64                randconfig-004-20260808    gcc-11.5.0
csky                            allmodconfig    gcc-16.1.0
csky                 randconfig-001-20260807    gcc-16.1.0
csky                 randconfig-001-20260808    gcc-11.5.0
csky                 randconfig-002-20260807    gcc-16.1.0
csky                 randconfig-002-20260808    gcc-11.5.0
hexagon              randconfig-001-20260807    clang-18
hexagon              randconfig-001-20260808    gcc-16.1.0
hexagon              randconfig-002-20260807    clang-18
hexagon              randconfig-002-20260808    gcc-16.1.0
i386                            allmodconfig    gcc-14
i386       buildonly-randconfig-001-20260807    gcc-13
i386       buildonly-randconfig-002-20260807    gcc-13
i386       buildonly-randconfig-003-20260807    gcc-13
i386       buildonly-randconfig-004-20260807    gcc-13
i386       buildonly-randconfig-005-20260807    gcc-13
i386       buildonly-randconfig-006-20260807    gcc-13
i386                          randconfig-001    clang-22
i386                 randconfig-001-20260807    gcc-14
i386                 randconfig-001-20260808    clang-22
i386                 randconfig-002-20260807    gcc-14
i386                 randconfig-002-20260808    clang-22
i386                 randconfig-003-20260807    gcc-14
i386                 randconfig-003-20260808    clang-22
i386                 randconfig-004-20260807    gcc-14
i386                 randconfig-004-20260808    clang-22
i386                 randconfig-005-20260807    gcc-14
i386                 randconfig-005-20260808    clang-22
i386                 randconfig-006-20260807    gcc-14
i386                 randconfig-006-20260808    clang-22
i386                 randconfig-007-20260807    gcc-14
i386                 randconfig-007-20260808    clang-22
i386                 randconfig-011-20260807    clang-22
i386                 randconfig-012-20260807    clang-22
i386                 randconfig-013-20260807    clang-22
i386                 randconfig-014-20260807    clang-22
i386                 randconfig-015-20260807    clang-22
i386                 randconfig-016-20260807    clang-22
i386                 randconfig-017-20260807    clang-22
loongarch                          defconfig    clang-24
loongarch            randconfig-001-20260807    clang-18
loongarch            randconfig-001-20260808    gcc-16.1.0
loongarch            randconfig-002-20260807    clang-18
loongarch            randconfig-002-20260808    gcc-16.1.0
m68k                      m5275evb_defconfig    gcc-16.1.0
mips                          ip32_defconfig    clang-17
nios2                           allmodconfig    gcc-11.5.0
nios2                            allnoconfig    gcc-11.5.0
nios2                randconfig-001-20260807    clang-18
nios2                randconfig-001-20260808    gcc-16.1.0
nios2                randconfig-002-20260807    clang-18
nios2                randconfig-002-20260808    gcc-16.1.0
parisc                          allmodconfig    gcc-16.1.0
parisc                          allyesconfig    gcc-16.1.0
parisc                             defconfig    gcc-16.1.0
parisc               randconfig-001-20260807    gcc-8.5.0
parisc               randconfig-001-20260808    gcc-8.5.0
parisc               randconfig-002-20260807    gcc-8.5.0
parisc               randconfig-002-20260808    gcc-8.5.0
powerpc              randconfig-001-20260807    gcc-8.5.0
powerpc              randconfig-001-20260808    gcc-8.5.0
powerpc              randconfig-002-20260807    gcc-8.5.0
powerpc              randconfig-002-20260808    gcc-8.5.0
powerpc64                       alldefconfig    clang-17
powerpc64            randconfig-001-20260807    gcc-8.5.0
powerpc64            randconfig-001-20260808    gcc-8.5.0
powerpc64            randconfig-002-20260807    gcc-8.5.0
powerpc64            randconfig-002-20260808    gcc-8.5.0
riscv                         randconfig-001    clang-24
riscv                         randconfig-001    gcc-12.5.0
riscv                randconfig-001-20260807    gcc-12.5.0
riscv                randconfig-001-20260808    clang-24
riscv                randconfig-002-20260807    gcc-12.5.0
riscv                randconfig-002-20260808    clang-24
s390                 randconfig-001-20260807    gcc-12.5.0
s390                 randconfig-001-20260808    clang-24
s390                 randconfig-002-20260807    gcc-12.5.0
s390                 randconfig-002-20260808    clang-24
sh                                 defconfig    gcc-16.1.0
sh                   randconfig-001-20260807    gcc-12.5.0
sh                   randconfig-001-20260808    clang-24
sh                   randconfig-002-20260807    gcc-12.5.0
sh                   randconfig-002-20260808    clang-24
sparc                         randconfig-001    gcc-16.1.0
sparc                randconfig-001-20260807    gcc-16.1.0
sparc                randconfig-002-20260807    gcc-16.1.0
sparc64              randconfig-001-20260807    gcc-16.1.0
sparc64              randconfig-002-20260807    gcc-16.1.0
um                   randconfig-001-20260807    gcc-16.1.0
um                   randconfig-002-20260807    gcc-16.1.0
x86_64     buildonly-randconfig-001-20260807    clang-22
x86_64     buildonly-randconfig-001-20260808    gcc-14
x86_64     buildonly-randconfig-002-20260807    clang-22
x86_64     buildonly-randconfig-002-20260808    gcc-14
x86_64     buildonly-randconfig-003-20260807    clang-22
x86_64     buildonly-randconfig-003-20260808    gcc-14
x86_64     buildonly-randconfig-004-20260807    clang-22
x86_64     buildonly-randconfig-004-20260808    gcc-14
x86_64     buildonly-randconfig-005-20260807    clang-22
x86_64     buildonly-randconfig-005-20260808    gcc-14
x86_64     buildonly-randconfig-006-20260807    clang-22
x86_64     buildonly-randconfig-006-20260808    gcc-14
x86_64                                 kexec    clang-22
x86_64               randconfig-001-20260807    clang-22
x86_64               randconfig-002-20260807    clang-22
x86_64               randconfig-003-20260807    clang-22
x86_64               randconfig-004-20260807    clang-22
x86_64               randconfig-005-20260807    clang-22
x86_64               randconfig-006-20260807    clang-22
x86_64                        randconfig-011    clang-22
x86_64               randconfig-011-20260807    clang-22
x86_64               randconfig-011-20260808    clang-22
x86_64               randconfig-012-20260807    clang-22
x86_64               randconfig-012-20260808    clang-22
x86_64               randconfig-013-20260807    clang-22
x86_64               randconfig-013-20260808    clang-22
x86_64               randconfig-014-20260807    clang-22
x86_64               randconfig-014-20260808    clang-22
x86_64               randconfig-015-20260807    clang-22
x86_64               randconfig-015-20260808    clang-22
x86_64               randconfig-016-20260807    clang-22
x86_64               randconfig-016-20260808    clang-22
x86_64               randconfig-071-20260807    clang-22
x86_64               randconfig-071-20260808    gcc-14
x86_64               randconfig-072-20260807    clang-22
x86_64               randconfig-072-20260808    gcc-14
x86_64               randconfig-073-20260807    clang-22
x86_64               randconfig-073-20260808    gcc-14
x86_64               randconfig-074-20260807    clang-22
x86_64               randconfig-074-20260808    gcc-14
x86_64               randconfig-075-20260807    clang-22
x86_64               randconfig-075-20260808    gcc-14
x86_64               randconfig-076-20260807    clang-22
x86_64               randconfig-076-20260808    gcc-14
x86_64                          rhel-9.4-bpf    gcc-14
xtensa               randconfig-001-20260807    gcc-16.1.0
xtensa               randconfig-002-20260807    gcc-16.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
