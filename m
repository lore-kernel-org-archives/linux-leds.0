Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84FCA39794E
	for <linux-leds@vger.kernel.org>; Sat,  5 Sep 2026 19:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788638227; cv=none; b=lvk0Da94LxyigEI37SqVtsVARkq/YpQB1F0uL+uAb5K5KuZE+U5xXjx+bQpDuVKm3rq3EZgAPS6ZpHrwctMig9SImVT/jDVgG7Z0s1j8NuoXcYCnlRmrPOMNkChMLaiYpVOT7lX0koM24xSeRQdVEIDVFy/62uDnvkRbH3LU7Mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788638227; c=relaxed/simple;
	bh=mNrPGfwZRNnMKZPZrS66PknEpgRlKisoppioMwTbgDE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DxDaIIVF/nL1eBsbQd/nK/MsNosUAYlhiWTlkWtLvT4szmFF2kYFtkmE0e5bLK1vOk1AhKKcBYG8HavlO4U5jqiHjx0kO7zKIYFt0eEG9biluFCzNQZgO/0/efqOeRrh+egt4dKy3RB73yVuy8lGx2sbxCJEp4zQ+gETFxrFGxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZcbwZUc9; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZcbwZUc9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788638223; x=1820174223;
  h=date:from:to:cc:subject:message-id;
  bh=mNrPGfwZRNnMKZPZrS66PknEpgRlKisoppioMwTbgDE=;
  b=ZcbwZUc9tbmMLwvpymI2c+rqq80pBurrwG4hynJgX0/NvXuQOY7D5XaG
   GBHs+Hk4yvk9WkzXAEE66wl7CPNhytL+h93a7b8gAz/FYCFPr9P8L/G/x
   RIEEBURw8MqZyhBVExecM64edjkCdctsBG0s2Mct2n4fawNhGVBoCrlHG
   xhpXiBP8Stq9dME86AKhusHS7X3r+Korr/C/OfvtbnLYJ+8cboEtNhaO5
   JGOCYuc7BG0e5UsjDM/yo9mqbnjuMLb2zirL6xOzmEGS1fgblC+zPYEi/
   gTFmxMCtGe8iQj3RSE3I7iAIgmu92xMMl1KARSfS0PkIBWXCpZCHlDIg1
   Q==;
X-CSE-ConnectionGUID: aBqvBMdXQz+9Zf8TiKwGzg==
X-CSE-MsgGUID: dbkcx4yDQj67NPU3+PM/XA==
X-IronPort-AV: E=McAfee;i="6800,10657,11897"; a="89137490"
X-IronPort-AV: E=Sophos;i="6.25,264,1779174000"; 
   d="scan'208";a="89137490"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2026 12:57:01 -0700
X-CSE-ConnectionGUID: t5dDYQBqQBuIw3IQYEdRIw==
X-CSE-MsgGUID: y9llMjmfQpSQQyaz4Pw99g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,264,1779174000"; 
   d="scan'208";a="266657858"
Received: from lkp-server01.sh.intel.com (HELO 73f3364bc37e) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 05 Sep 2026 12:56:59 -0700
Received: from kbuild by 73f3364bc37e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x2wVV-0000000012d-0d4r;
	Sat, 05 Sep 2026 19:56:57 +0000
Date: Sun, 06 Sep 2026 03:56:18 +0800
From: kernel test robot <lkp@intel.com>
To: Lee Jones <lee@kernel.org>
Cc: linux-leds@vger.kernel.org
Subject: [lee-leds:for-leds-next] BUILD SUCCESS
 4805e5ec50d0b355370e3d1ea906af4fc758accf
Message-ID: <202609060315.RxRXPDl7-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git for-leds-next
branch HEAD: 4805e5ec50d0b355370e3d1ea906af4fc758accf  leds: max77705: Use fwnode_for_each_child_node_scoped() in max77705_add_led()

elapsed time: 3091m

configs tested: 55
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha         allnoconfig    gcc-16.1.0
alpha        allyesconfig    gcc-16.1.0
arc          allmodconfig    clang-24
arc           allnoconfig    gcc-16.1.0
arc          allyesconfig    clang-24
arm           allnoconfig    gcc-16.1.0
arm          allyesconfig    clang-24
arm64        allmodconfig    clang-24
arm64         allnoconfig    gcc-16.1.0
csky         allmodconfig    gcc-16.1.0
csky          allnoconfig    gcc-16.1.0
hexagon      allmodconfig    gcc-16.1.0
hexagon       allnoconfig    gcc-16.1.0
i386         allmodconfig    clang-22
i386          allnoconfig    gcc-16.1.0
i386         allyesconfig    clang-22
loongarch    allmodconfig    clang-24
loongarch     allnoconfig    gcc-16.1.0
m68k         allmodconfig    gcc-16.1.0
m68k          allnoconfig    gcc-16.1.0
m68k         allyesconfig    clang-24
microblaze    allnoconfig    gcc-16.1.0
microblaze   allyesconfig    gcc-16.1.0
mips         allmodconfig    gcc-16.1.0
mips          allnoconfig    gcc-16.1.0
mips         allyesconfig    gcc-16.1.0
nios2        allmodconfig    clang-20
nios2         allnoconfig    clang-24
openrisc     allmodconfig    clang-20
openrisc      allnoconfig    clang-24
parisc       allmodconfig    gcc-16.1.0
parisc        allnoconfig    clang-24
parisc       allyesconfig    clang-17
powerpc      allmodconfig    gcc-16.1.0
powerpc       allnoconfig    clang-24
riscv        allmodconfig    clang-24
riscv         allnoconfig    clang-24
riscv        allyesconfig    clang-24
s390         allmodconfig    clang-17
s390          allnoconfig    clang-24
s390         allyesconfig    gcc-16.1.0
sh           allmodconfig    gcc-16.1.0
sh            allnoconfig    clang-24
sh           allyesconfig    clang-17
sparc         allnoconfig    clang-24
sparc64      allmodconfig    clang-20
um           allmodconfig    clang-17
um            allnoconfig    clang-24
um           allyesconfig    gcc-16.1.0
x86_64       allmodconfig    clang-22
x86_64        allnoconfig    clang-24
x86_64       allyesconfig    clang-22
x86_64      rhel-9.4-rust    clang-22
xtensa        allnoconfig    clang-24
xtensa       allyesconfig    clang-20

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
