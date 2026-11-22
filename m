Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795327559;
	b=djDo0wfhxQj/sAToy3eTOsb422O+5RSfdIfUMem1uIAQv639CDZlxss9nOr0cmEBcTeP
	 8YuPrhPVpZ86zu2+x/cAA0AgNt4oVLzSNWXzPlo1nGL2EtvwWMj0YQPFRX+rOjrTjVclM
	 MLepsqV1AmYiiAWk5ngBQLaGRsL4qLRsB7zOfGJ2+WHUlXVpd/7W7txG3X5KwNYUxRou6
	 OkuByF9j/0KJihImlWbvdo+Gh/Sa73Yi1kyPzLeiLOyjwTMo9N/dGhnZGpOpUPfXLK+v1
	 Cxk5/XXdmzv4POMJ5lVdTPd1qATgK0T7zCqabfMK7XX8ZUHQvzW+wvZs2uWl2NIs3ug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795327559;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=8GRkgnoxCodxjYQUul8kN+6HyHw58JNYN3FbQdnUyHg=;
	b=b15RYQ6LsoZsjMjZgZmYjcMi09DxaYMz+l5qzTRtLWlliX472FDY8N3Qsid6Q5nAi+IQ
	 itRho/qNoGy3rY70H9GZwcdU4z69Xwf+Kl1RNlzfivuhOcrBtY8QWrge9gVn87YzQpQVR
	 5sVKdQl+mh6s9jWLAGEm50whfrQvAjwHaPpeS8+Gl+aXXzHmmxt8WKMXXDNhpW7evSWON
	 PJpouZI54yk+QifTnP2+whvYQai4uiwIoBxQprICuCnkKvS4Y3czTWTesSAhtTUofsSG2
	 pyyGZ4uWDGUIC1VvrI9bC33fYmF9B0GWcMgMLn7jEDP3zEh6omOSnPfhnBWIvhNFOTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="j/ROO/DD";
	arc=none smtp.remote-ip=192.198.163.14
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F6AF606A32A
	for <linux-leds@vger.kernel.org>; Sun, 22 Nov 2026 06:05:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F6AF606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=j/ROO/DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795327558; x=1826863558;
  h=date:from:to:cc:subject:message-id;
  bh=lb90I1muG+9IUJe08NnZbgGud6Rhop4ZOdl0aSX0RXI=;
  b=j/ROO/DDMJ9xoUcGBYbajE7/qp7Fy3sXPQIl4D8DKYGDgLY7VGW+vay+
   CQCCyFIfI4a3VMty0plmki4MqFE9UhEITO66YUZ667KrmLXWtCJAi9DEm
   CjJkMNS3mp6E/+tJkwOGJSADJkWvueveh3mu56Jm41kpXCgA226+VI5ht
   GA2FfhRfKT154D03VwTdRBppNzWtlV8WuxkAiyRuxvtn932JSekKQ1B1f
   HuHbuNpQD9EQ5XcXAUjlPXrQcR5UVZMmOmGbVVizO0KefhCQeoRn/N2ke
   xt4wwDhoIrLPU7WxHrYvx4/zyXV2VERArsuSuR/nKlATZzVKd2gi0eS7K
   Q==;
X-CSE-ConnectionGUID: krqaTYjIRbO2ssdMP5OFpQ==
X-CSE-MsgGUID: EmBDYn2UQhO0h89ha2fBAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11973"; a="4051269"
X-IronPort-AV: E=Sophos;i="6.27,226,1787036400"; 
   d="scan'208";a="4051269"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2026 22:05:58 -0800
X-CSE-ConnectionGUID: I56S27mSQ/++cfFh4itcKA==
X-CSE-MsgGUID: 9ojnyvaARMa+Xgex+pD67Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,226,1787036400"; 
   d="scan'208";a="11036426"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 21 Nov 2026 22:05:56 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xV0i1-00000001L6I-3HD5;
	Sun, 22 Nov 2026 06:05:53 +0000
Date: Sun, 22 Nov 2026 14:05:48 +0800
From: kernel test robot <lkp@intel.com>
To: Lee Jones <lee@kernel.org>
Cc: linux-leds@vger.kernel.org
Subject: [lee-leds:for-leds-next] BUILD SUCCESS
 c016466c8c8b01af27ac66d97b64fa9c9e431a3d
Message-ID: <20261122140548.QULF5oRP-lkp@intel.com>
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
branch HEAD: c016466c8c8b01af27ac66d97b64fa9c9e431a3d  leds: trigger: netdev: Report invalid interval to user space

elapsed time: 2932m

configs tested: 229
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha        randconfig-2000-20261120    gcc-13.5.0
alpha        randconfig-2000-20261120    gcc-15.3.0
alpha        randconfig-2001-20261120    gcc-15.3.0
alpha        randconfig-2200-20261120    gcc-15.3.0 smatch
alpha       randconfig-r2107-20261120    gcc-11.5.0 cocci
alpha       randconfig-r2109-20261120    gcc-11.5.0 cocci
alpha       randconfig-r2306-20261120    gcc-11.5.0 sparse
arc          randconfig-2000-20261120    gcc-11.5.0
arc          randconfig-2000-20261120    gcc-9.5.0
arc          randconfig-2001-20261120    gcc-11.5.0
arc          randconfig-2002-20261120    gcc-11.5.0
arc          randconfig-2002-20261120    gcc-8.5.0
arc          randconfig-2003-20261120    gcc-11.5.0
arc          randconfig-2003-20261120    gcc-8.5.0
arc          randconfig-2004-20261120    gcc-11.5.0
arc          randconfig-2004-20261120    gcc-9.5.0
arc          randconfig-2005-20261120    gcc-11.5.0
arc          randconfig-2200-20261120    gcc-15.3.0 smatch
arm          randconfig-2000-20261120    gcc-11.5.0
arm          randconfig-2000-20261120    gcc-8.5.0
arm          randconfig-2001-20261120    gcc-8.5.0
arm          randconfig-2002-20261120    clang-24
arm          randconfig-2002-20261120    gcc-8.5.0
arm          randconfig-2200-20261120    clang-17   smatch
arm         randconfig-r2101-20261120    clang-17   cocci
arm         randconfig-r2302-20261120    clang-24   sparse
arm64        randconfig-2000-20261120    clang-24
arm64        randconfig-2000-20261120    gcc-8.5.0
arm64        randconfig-2001-20261120    gcc-8.5.0
arm64        randconfig-2002-20261120    gcc-14.4.0
arm64        randconfig-2002-20261120    gcc-8.5.0
arm64        randconfig-2200-20261120    clang-17   smatch
csky         randconfig-2000-20261120    gcc-13.5.0
csky         randconfig-2000-20261121    gcc-16.2.0
csky         randconfig-2001-20261120    gcc-16.2.0
csky         randconfig-2001-20261121    gcc-16.2.0
csky         randconfig-2200-20261120    gcc-15.3.0 smatch
hexagon      randconfig-2000-20261120    clang-24
hexagon      randconfig-2000-20261121    gcc-16.2.0
hexagon      randconfig-2001-20261120    clang-24
hexagon      randconfig-2001-20261121    gcc-16.2.0
hexagon      randconfig-2200-20261120    clang-17   smatch
hexagon     randconfig-r2100-20261120    clang-22   cocci
hexagon     randconfig-r2310-20261120    gcc-11.5.0 sparse
i386         randconfig-2000-20261120    clang-22
i386         randconfig-2000-20261120    gcc-14
i386         randconfig-2001-20261120    clang-22
i386         randconfig-2001-20261120    gcc-14
i386         randconfig-2002-20261120    clang-22
i386         randconfig-2003-20261120    clang-22
i386         randconfig-2004-20261120    clang-22
i386         randconfig-2005-20261120    clang-22
i386         randconfig-2100-20261120    clang-22   cocci
i386         randconfig-2100-20261120    gcc-14     cocci
i386         randconfig-2101-20261120    gcc-14     cocci
i386         randconfig-2102-20261120    gcc-14     cocci
i386         randconfig-2103-20261120    clang-22   cocci
i386         randconfig-2103-20261120    gcc-14     cocci
i386         randconfig-2104-20261120    gcc-14     cocci
i386         randconfig-2105-20261120    gcc-12     cocci
i386         randconfig-2105-20261120    gcc-14     cocci
i386         randconfig-2200-20261120    clang-22   smatch
i386         randconfig-2300-20261120    clang-22   sparse
i386         randconfig-2301-20261120    clang-22   sparse
i386         randconfig-2302-20261120    clang-22   sparse
i386        randconfig-r2103-20261120    gcc-14     cocci
i386        randconfig-r2302-20261120    clang-20   sparse
i386        randconfig-r2311-20261120    gcc-14     sparse
loongarch    randconfig-2000-20261120    clang-24
loongarch    randconfig-2001-20261120    clang-20
loongarch    randconfig-2001-20261120    clang-24
loongarch    randconfig-2200-20261120    clang-18   smatch
loongarch   randconfig-r2305-20261120    gcc-12.5.0 sparse
loongarch   randconfig-r2309-20261120    gcc-11.5.0 sparse
m68k         randconfig-2000-20261120    gcc-12.5.0
m68k         randconfig-2000-20261120    gcc-15.3.0
m68k         randconfig-2001-20261120    gcc-15.3.0
m68k         randconfig-2001-20261120    gcc-8.5.0
m68k         randconfig-2200-20261120    gcc-14.4.0 smatch
m68k        randconfig-r2104-20261120    gcc-8.5.0  cocci
m68k        randconfig-r2106-20261120    gcc-11.5.0 cocci
microblaze   randconfig-2000-20261120    gcc-15.3.0
microblaze   randconfig-2000-20261120    gcc-9.5.0
microblaze   randconfig-2001-20261120    gcc-15.3.0
microblaze   randconfig-2001-20261120    gcc-8.5.0
microblaze   randconfig-2200-20261120    gcc-11.5.0 smatch
mips         randconfig-2000-20261120    gcc-15.3.0
mips         randconfig-2000-20261120    gcc-9.5.0
mips         randconfig-2001-20261120    clang-19
mips         randconfig-2001-20261120    gcc-9.5.0
mips         randconfig-2002-20261120    gcc-11.5.0
mips         randconfig-2002-20261120    gcc-9.5.0
mips         randconfig-2200-20261120    clang-24   smatch
mips        randconfig-r2306-20261120    clang-24   sparse
nios2        randconfig-2000-20261120    clang-24
nios2        randconfig-2000-20261120    gcc-8.5.0
nios2        randconfig-2001-20261120    clang-24
nios2        randconfig-2001-20261120    gcc-8.5.0
nios2        randconfig-2200-20261120    gcc-11.5.0 smatch
nios2       randconfig-r2300-20261120    gcc-10.5.0 sparse
nios2       randconfig-r2301-20261120    gcc-11.5.0 sparse
nios2       randconfig-r2303-20261120    clang-20   sparse
nios2       randconfig-r2303-20261120    gcc-11.5.0 sparse
nios2       randconfig-r2311-20261120    gcc-11.5.0 sparse
openrisc     randconfig-2000-20261120    gcc-9.5.0
openrisc     randconfig-2001-20261120    gcc-11.5.0
openrisc     randconfig-2001-20261120    gcc-9.5.0
openrisc     randconfig-2002-20261120    gcc-9.5.0
openrisc     randconfig-2200-20261120    gcc-11.5.0 smatch
openrisc    randconfig-r2100-20261120    gcc-8.5.0  cocci
openrisc    randconfig-r2102-20261120    gcc-10.5.0 cocci
openrisc    randconfig-r2307-20261120    gcc-11.5.0 sparse
openrisc    randconfig-r2307-20261120    gcc-14.4.0 sparse
parisc       randconfig-2000-20261120    clang-24
parisc       randconfig-2000-20261120    gcc-8.5.0
parisc       randconfig-2001-20261120    clang-24
parisc       randconfig-2001-20261120    gcc-13.5.0
parisc       randconfig-2200-20261120    gcc-8.5.0  smatch
parisc      randconfig-r2110-20261120    gcc-11.5.0 cocci
powerpc      randconfig-2000-20261120    clang-17
powerpc      randconfig-2000-20261120    clang-24
powerpc      randconfig-2001-20261120    clang-19
powerpc      randconfig-2001-20261120    clang-24
powerpc      randconfig-2002-20261120    clang-24
powerpc      randconfig-2200-20261120    clang-17   smatch
powerpc     randconfig-r2301-20261120    clang-20   sparse
powerpc64    randconfig-2000-20261120    clang-24
powerpc64    randconfig-2001-20261120    clang-24
powerpc64    randconfig-2002-20261120    clang-18
powerpc64    randconfig-2002-20261120    clang-24
powerpc64    randconfig-2200-20261120    gcc-16.2.0 smatch
powerpc64   randconfig-r2308-20261120    gcc-14.4.0 sparse
powerpc64   randconfig-r2310-20261120    gcc-10.5.0 sparse
riscv        randconfig-2000-20261120    clang-24
riscv        randconfig-2001-20261120    clang-24
riscv        randconfig-2001-20261120    gcc-10.5.0
riscv        randconfig-2002-20261120    clang-24
riscv        randconfig-2002-20261120    gcc-8.5.0
riscv        randconfig-2003-20261120    clang-24
riscv        randconfig-2004-20261120    clang-20
riscv        randconfig-2004-20261120    clang-24
riscv        randconfig-2005-20261120    clang-24
riscv        randconfig-2005-20261120    gcc-10.5.0
riscv        randconfig-2200-20261120    gcc-8.5.0  smatch
s390         randconfig-2000-20261120    clang-24
s390         randconfig-2000-20261120    gcc-8.5.0
s390         randconfig-2001-20261120    clang-24
s390         randconfig-2002-20261120    clang-24
s390         randconfig-2003-20261120    clang-24
s390         randconfig-2004-20261120    clang-24
s390         randconfig-2004-20261120    gcc-16.2.0
s390         randconfig-2005-20261120    clang-24
s390         randconfig-2200-20261120    clang-17   smatch
s390        randconfig-r2102-20261120    gcc-8.5.0  cocci
s390        randconfig-r2104-20261120    gcc-8.5.0  cocci
s390        randconfig-r2105-20261120    clang-24   cocci
s390        randconfig-r2304-20261120    clang-24   sparse
s390        randconfig-r2308-20261120    gcc-11.5.0 sparse
sh           randconfig-2000-20261120    gcc-11.5.0
sh           randconfig-2000-20261120    gcc-16.2.0
sh           randconfig-2001-20261120    gcc-11.5.0
sh           randconfig-2001-20261120    gcc-16.2.0
sh           randconfig-2002-20261120    gcc-11.5.0
sh           randconfig-2002-20261120    gcc-16.2.0
sh           randconfig-2003-20261120    gcc-11.5.0
sh           randconfig-2004-20261120    gcc-11.5.0
sh           randconfig-2004-20261120    gcc-16.2.0
sh           randconfig-2005-20261120    gcc-11.5.0
sh           randconfig-2005-20261120    gcc-15.3.0
sh           randconfig-2200-20261120    gcc-11.5.0 smatch
sh          randconfig-r2103-20261120    gcc-8.5.0  cocci
sh          randconfig-r2108-20261120    gcc-11.5.0 cocci
sh          randconfig-r2309-20261120    gcc-13.5.0 sparse
sparc        randconfig-2000-20261120    gcc-16.2.0
sparc        randconfig-2000-20261120    gcc-8.5.0
sparc        randconfig-2001-20261120    gcc-8.5.0
sparc        randconfig-2200-20261120    gcc-11.5.0 smatch
sparc       randconfig-r2105-20261120    gcc-8.5.0  cocci
sparc64      randconfig-2000-20261120    gcc-8.5.0
sparc64      randconfig-2001-20261120    gcc-8.5.0
sparc64      randconfig-2200-20261120    gcc-14.4.0 smatch
sparc64     randconfig-r2101-20261120    gcc-8.5.0  cocci
sparc64     randconfig-r2304-20261120    clang-20   sparse
um           randconfig-2000-20261120    clang-24
um           randconfig-2000-20261120    gcc-8.5.0
um           randconfig-2001-20261120    gcc-14
um           randconfig-2001-20261120    gcc-8.5.0
um           randconfig-2200-20261120    clang-24   smatch
um          randconfig-r2305-20261120    clang-20   sparse
x86_64                          kexec    clang-22
x86_64       randconfig-2000-20261120    clang-22
x86_64       randconfig-2000-20261120    gcc-14
x86_64       randconfig-2001-20261120    clang-22
x86_64       randconfig-2001-20261120    gcc-14
x86_64       randconfig-2002-20261120    clang-22
x86_64       randconfig-2003-20261120    clang-22
x86_64       randconfig-2004-20261120    clang-22
x86_64       randconfig-2005-20261120    clang-22
x86_64       randconfig-2005-20261120    gcc-14
x86_64       randconfig-2100-20261120    gcc-14     cocci
x86_64       randconfig-2101-20261120    gcc-14     cocci
x86_64       randconfig-2102-20261120    gcc-14     cocci
x86_64       randconfig-2103-20261120    clang-22   cocci
x86_64       randconfig-2103-20261120    gcc-14     cocci
x86_64       randconfig-2104-20261120    clang-22   cocci
x86_64       randconfig-2104-20261120    gcc-14     cocci
x86_64       randconfig-2105-20261120    clang-22   cocci
x86_64       randconfig-2105-20261120    gcc-14     cocci
x86_64       randconfig-2200-20261120    clang-22   smatch
x86_64       randconfig-2300-20261120    clang-22   sparse
x86_64       randconfig-2301-20261120    clang-22   sparse
x86_64       randconfig-2302-20261120    clang-22   sparse
x86_64      randconfig-r2111-20261120    gcc-11.5.0 cocci
x86_64                       rhel-9.4    clang-22
x86_64                   rhel-9.4-bpf    clang-22
x86_64                   rhel-9.4-bpf    gcc-14
x86_64                  rhel-9.4-func    clang-22
x86_64            rhel-9.4-kselftests    clang-22
x86_64                 rhel-9.4-kunit    clang-22
x86_64                 rhel-9.4-kunit    gcc-14
x86_64                   rhel-9.4-ltp    clang-22
x86_64                   rhel-9.4-ltp    gcc-14
x86_64                  rhel-9.4-rust    clang-22
xtensa       randconfig-2000-20261120    gcc-15.3.0
xtensa       randconfig-2000-20261121    gcc-16.2.0
xtensa       randconfig-2001-20261120    gcc-8.5.0
xtensa       randconfig-2001-20261121    gcc-16.2.0
xtensa       randconfig-2200-20261120    gcc-9.5.0  smatch
xtensa      randconfig-r2300-20261120    clang-20   sparse

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
