Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3193C1BD9C9
	for <linux-leds@vger.kernel.org>; Fri, 14 Aug 2026 00:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786667790; cv=none; b=fVOPRmUNonGLa3W3dxSJH4qyqNR1jtE7iiOUYs3knI6/KV74UZKUvXuazv7hq2ln+ukCSnZudptXPIK7oHfhbYJXN8Qk2p9SYg23IovVMCJqAhKyvwKmCiJ6MAYXFdLw6/yY00/BEf7EvgPMlVM+riw04Yim+MsRXz7oCgulEc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786667790; c=relaxed/simple;
	bh=zVSsBGe7EbmBlUUSAe0Ij27S7VXGpnELkFbCEO4/fOg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=nXURFWfQl9k8cIp4A/Alm40zPsMcLcG3Jdcw5IQuCK70POjRr9G6+0WKiFrNK4Ouvhcxmk6r1hYTIVJJqF4DKnVxg1GNAWv3sqJuiSJJNzdKAQRw9dicJcwOEC71oQlGXC2+R1kCJuR65TUIdn0cl9bjQ+vduviDjOdCC/3L0nM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UAPzKb1l; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UAPzKb1l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786667788; x=1818203788;
  h=date:from:to:cc:subject:message-id;
  bh=zVSsBGe7EbmBlUUSAe0Ij27S7VXGpnELkFbCEO4/fOg=;
  b=UAPzKb1lzz3D1fhWSQsaNKlFt6s/MESbxSJmzMabGPHIVuGte/r5wwl7
   TrV53Pr7Shl/ywYX9/Ryxyk7zTdcDvDPG3WIzcQMkXuwYA7zbDuHZ/BdN
   wTBd7HG2Ue3eqNhkYP4i+GA7et1Ilsm6/1D/nf3M1TSgJPk76AV3hus9s
   xP4WI14T2TtPC0OJwyOH3Rx2is4eu8t4s6L3vCZyTn6BqclTUMGZLpmM6
   ZjgkWdx0gT2IS+p5nUVsTMQiNlz5H4UPzz8Z4r7JWHtRKQmfTKgwiYgb0
   qFa4OetG4koti98PEEnz6Btgc7EpI9XscprIf80lVOTmE8KqBQyU4N/06
   Q==;
X-CSE-ConnectionGUID: rJ6dtJryRt+ctJtsFdFPIw==
X-CSE-MsgGUID: jc8xudSuT1C/h9zCQBXeIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11874"; a="87176322"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; 
   d="scan'208";a="87176322"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2026 17:36:28 -0700
X-CSE-ConnectionGUID: se2jX2s1To+Jc2CfxixrAA==
X-CSE-MsgGUID: 8E2fV0zsTB2gGO8jE5pqYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; 
   d="scan'208";a="263644205"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 13 Aug 2026 17:36:26 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wufuK-00000000X6m-2mtm;
	Fri, 14 Aug 2026 00:36:24 +0000
Date: Fri, 14 Aug 2026 08:36:09 +0800
From: kernel test robot <lkp@intel.com>
To: Lee Jones <lee@kernel.org>
Cc: linux-leds@vger.kernel.org
Subject: [lee-leds:for-leds-next] BUILD SUCCESS
 f8cca63a0a4f3475199d9ab7f86782bdfeb0744d
Message-ID: <202608140857.Q1OY3qu6-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git for-leds-next
branch HEAD: f8cca63a0a4f3475199d9ab7f86782bdfeb0744d  leds: is31fl319x: Modernize registration

elapsed time: 799m

configs tested: 21
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                  allnoconfig    gcc-16.1.0
alpha                 allyesconfig    gcc-16.1.0
alpha                    defconfig    gcc-16.1.0
arc                   allmodconfig    gcc-16.1.0
arc                   allyesconfig    gcc-16.1.0
arc                 hsdk_defconfig    gcc-16.1.0
csky                  allmodconfig    gcc-16.1.0
i386                  allmodconfig    gcc-14
loongarch                defconfig    clang-24
nios2                 allmodconfig    gcc-11.5.0
nios2                  allnoconfig    gcc-11.5.0
parisc                allmodconfig    gcc-16.1.0
parisc                allyesconfig    gcc-16.1.0
parisc                   defconfig    gcc-16.1.0
riscv      randconfig-001-20260814    gcc-14.3.0
riscv      randconfig-002-20260814    clang-24
s390       randconfig-001-20260814    gcc-11.5.0
s390       randconfig-002-20260814    gcc-13.4.0
sh                       defconfig    gcc-16.1.0
sh         randconfig-001-20260814    gcc-16.1.0
sh         randconfig-002-20260814    gcc-16.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
