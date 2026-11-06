Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793962998;
	b=wSvIKiV7r/gZpvprWjwFfnq4y4H117qtfas1t4raTk6Xvp4H6jRH9TuvOQKrVZxmU+yY
	 E8fGdxKeuvlo07f/39waH0s5rGrMy+bGcwynPlPCBC8nEpVT3VAM4Cq72i197AkXxdxe6
	 ClCRhh+puPaGQoPI6ea9oT8OGt2t6F6WTQSJ3cwlmJT2s2g/oZkrM9xDf6lCZka/X0sKv
	 kTwQlUYgtHHI/sqHQY5txE1N7GDG8uxFhilEZ/yIOHwb2aM3bju1xNfImYpnq4xeNeZxy
	 P10J87FJl5M4AW2YePnM6GCmdWSGNIXOuvW4/nJQRQQmWjcvDb9BUNOw+v3RR+M1uRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793962998;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=9z15nxOpojanaM28bnnjHBiNlUCk6GCv+ZyU/uIbtEU=;
	b=frLbfCQITtHzAnJ28b8oCKxG/lgW+eNy7j3QuzxMs32s2QY87l8HbC0mFVZ8S4h2rzU+
	 XO91WQjyQIoLaDJtsfvHpv0YaYPgEFcJ8PLO+7Nojyaj33OvSUNasoPrQ/EXraR6FBukg
	 q1xgNCA2eB0tc/GmXTIcaIJrMiPPyutYwiJrJYzjf+SYCXcr5aUeE503vDPe8fjVDcz+J
	 r3JPUAk0BFyPTbSydLXrutu5U9uEN3yugs520Q5eMpK6OjosZgEj1tlWfpLSn63uZo3Fd
	 CgzOMGyLE1f3HMq5yUZBhl+f2cohX16NwYC/5odd6rRkNvT/qLIm/wje1Cvy3SPZTDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=S+I5qeZ5;
	arc=none smtp.remote-ip=192.198.163.14
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 007B1606A336
	for <linux-leds@vger.kernel.org>; Fri,  6 Nov 2026 11:03:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 007B1606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=S+I5qeZ5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793962996; x=1825498996;
  h=date:from:to:cc:subject:message-id;
  bh=NxDmXow5CT6GUsNL5vXegXNmsjZhuTza63UOeHRP/SI=;
  b=S+I5qeZ5Ymxu2ojFb5Fzc0D0a9Pe7TUPfzOLs2dRVQUBHVsbmy5fs6FA
   ypp8dmPMEYMF6LbXkZYHUoOyeLHFHJAeEiQ6/4BN+DjakwS1cEztBThPQ
   lYG96bX8GkVborIjZ9a+u38ijx7cp/Kxv8f32ri70u9FMvZUSATzOT+bG
   wWOfvs58L916PYKvO8aoaM9SHZ73UdWrb7GubrL7C6i0bY6tk2vvzYkLF
   6E7jiKJViWT5xarXVvyh7DND9xw3nOmD5o7jx3VJKxdD3sxbvu8OBFVZ9
   lckLkT8cEwCI+GIyAJ0APe2TKPpcg+b158GDYJTzmpDPwS0HU7tk4Vh48
   A==;
X-CSE-ConnectionGUID: kIHTVu/USzmSuHoaJEWo7g==
X-CSE-MsgGUID: xlLDhA30QS2bocVMZdsd0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2806246"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2806246"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2026 03:03:16 -0800
X-CSE-ConnectionGUID: h1IprVKTTuqgGUB2ThzS6Q==
X-CSE-MsgGUID: m9H+AGXeQWuL4LIjWXjdTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7592734"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 06 Nov 2026 03:03:13 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xPHix-00000000p5r-2i5i;
	Fri, 06 Nov 2026 11:03:11 +0000
Date: Fri, 06 Nov 2026 19:02:16 +0800
From: kernel test robot <lkp@intel.com>
To: Lee Jones <lee@kernel.org>
Cc: linux-leds@vger.kernel.org
Subject: [lee-leds:for-leds-next] BUILD REGRESSION
 a379f4e0adf2de7b11aa3ef87eeb7d9c838069b3
Message-ID: <20261106190216.PDC0Nsd0-lkp@intel.com>
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
branch HEAD: a379f4e0adf2de7b11aa3ef87eeb7d9c838069b3  leds: lm3692x: Use devm_mutex_init() to avoid premature mutex destruction

Error/Warning (recently discovered and may have been fixed):

    https://lore.kernel.org/oe-kbuild-all/202611051619.MBISEO1w-lkp@intel.com
    https://lore.kernel.org/oe-kbuild-all/202611051650.vcD7uJMK-lkp@intel.com
    https://lore.kernel.org/oe-kbuild-all/202611060517.YOgU4Gr8-lkp@intel.com

    drivers/leds/leds-pca955x.c:544:37: error: 'client' undeclared (first use in this function)
    drivers/leds/leds-pca955x.c:544:37: error: 'client' undeclared (first use in this function); did you mean 'count'?
    drivers/leds/leds-pca955x.c:544:37: error: use of undeclared identifier 'client'
    drivers/leds/leds-pca955x.c:544:44: error: 'client' undeclared (first use in this function)
    drivers/leds/leds-pca955x.c:562:11: error: incompatible pointer to integer conversion returning 'void *' from a function with result type 'int' [-Wint-conversion]
    drivers/leds/leds-pca955x.c:562:11: warning: returning 'void *' from a function with return type 'int' makes integer from pointer without a cast [-Wint-conversion]
    drivers/leds/leds-pca955x.c:562:32: error: returning 'void *' from a function with return type 'int' makes integer from pointer without a cast [-Wint-conversion]
    drivers/leds/leds-pca955x.c:562:32: warning: returning 'void *' from a function with return type 'int' makes integer from pointer without a cast [-Wint-conversion]

Error/Warning ids grouped by kconfigs:

recent_errors
|-- alpha-allyesconfig
|   |-- drivers-leds-leds-pca955x.c:error:client-undeclared-(first-use-in-this-function)
|   `-- drivers-leds-leds-pca955x.c:error:returning-void-from-a-function-with-return-type-int-makes-integer-from-pointer-without-a-cast
|-- arc-allmodconfig
|   |-- drivers-leds-leds-pca955x.c:error:client-undeclared-(first-use-in-this-function)
|   `-- drivers-leds-leds-pca955x.c:error:returning-void-from-a-function-with-return-type-int-makes-integer-from-pointer-without-a-cast
|-- arc-allyesconfig
|   |-- drivers-leds-leds-pca955x.c:error:client-undeclared-(first-use-in-this-function)
|   `-- drivers-leds-leds-pca955x.c:error:returning-void-from-a-function-with-return-type-int-makes-integer-from-pointer-without-a-cast
|-- arc-randconfig-1000-20261105
|   |-- drivers-leds-leds-pca955x.c:error:client-undeclared-(first-use-in-this-function)
|   `-- drivers-leds-leds-pca955x.c:warning:returning-void-from-a-function-with-return-type-int-makes-integer-from-pointer-without-a-cast
|-- arc-randconfig-1000-20261106
|   |-- drivers-leds-leds-pca955x.c:error:client-undeclared-(first-use-in-this-function)
|   `-- drivers-leds-leds-pca955x.c:warning:returning-void-from-a-function-with-return-type-int-makes-integer-from-pointer-without-a-cast
|-- arc-randconfig-1001-20261105
|   |-- drivers-leds-leds-pca955x.c:error:client-undeclared-(first-use-in-this-function)
|   `-- drivers-leds-leds-pca955x.c:error:returning-void-from-a-function-with-return-type-int-makes-integer-from-pointer-without-a-cast
|-- arc-randconfig-1001-20261106
|   |-- drivers-leds-leds-pca955x.c:error:client-undeclared-(first-use-in-this-function)
|   `-- drivers-leds-leds-pca955x.c:warning:returning-void-from-a-function-with-return-type-int-makes-integer-from-pointer-without-a-cast
|-- arm64-allmodconfig
|   |-- drivers-leds-leds-pca955x.c:error:incompatible-pointer-to-integer-conversion-returning-void-from-a-function-with-result-type-int
|   `-- drivers-leds-leds-pca955x.c:error:use-of-undeclared-identifier-client
|-- arm64-randconfig-1000-20261106
|   |-- drivers-leds-leds-pca955x.c:error:incompatible-pointer-to-integer-conversion-returning-void-from-a-function-with-result-type-int
|   `-- drivers-leds-leds-pca955x.c:error:use-of-undeclared-identifier-client
|-- arm64-randconfig-1001-20261106
|   |-- drivers-leds-leds-pca955x.c:error:client-undeclared-(first-use-in-this-function)
|   `-- drivers-leds-leds-pca955x.c:warning:returning-void-from-a-function-with-return-type-int-makes-integer-from-pointer-without-a-cast
|-- arm64-randconfig-1003-20261106
|   |-- drivers-leds-leds-pca955x.c:error:incompatible-pointer-to-integer-conversion-returning-void-from-a-function-with-result-type-int
|   `-- drivers-leds-leds-pca955x.c:error:use-of-undeclared-identifier-client
|-- arm-allyesconfig
|   |-- drivers-leds-leds-pca955x.c:error:client-undeclared-(first-use-in-this-function)
|   `-- drivers-leds-leds-pca955x.c:error:returning-void-from-a-function-with-return-type-int-makes-integer-from-pointer-without-a-cast
|-- arm-randconfig-1000-20261105
|   |-- drivers-leds-leds-pca955x.c:error:client-undeclared-(first-use-in-this-function)
|   `-- drivers-leds-leds-pca955x.c:error:returning-void-from-a-function-with-return-type-int-makes-integer-from-pointer-without-a-cast
|-- arm-randconfig-1001-20261105
|   |-- drivers-leds-leds-pca955x.c:error:incompatible-pointer-to-integer-conversion-returning-void-from-a-function-with-result-type-int
|   `-- drivers-leds-leds-pca955x.c:error:use-of-undeclared-identifier-client
|-- arm-randconfig-1001-20261106
|   |-- drivers-leds-leds-pca955x.c:error:client-undeclared-(first-use-in-this-function)
|   `-- drivers-leds-leds-pca955x.c:error:returning-void-from-a-function-with-return-type-int-makes-integer-from-pointer-without-a-cast
|-- arm-randconfig-1003-20261106
|   |-- drivers-leds-leds-pca955x.c:error:incompatible-pointer-to-integer-conversion-returning-void-from-a-function-with-result-type-int
|   `-- drivers-leds-leds-pca955x.c:error:use-of-undeclared-identifier-client
|-- csky-allmodconfig
|   |-- drivers-leds-leds-pca955x.c:error:client-undeclared-(first-use-in-this-function)
|   `-- drivers-leds-leds-pca955x.c:error:returning-void-from-a-function-with-return-type-int-makes-integer-from-pointer-without-a-cast
|-- csky-randconfig-1001-20261106
|   |-- drivers-leds-leds-pca955x.c:error:client-undeclared-(first-use-in-this-function)
|   `-- drivers-leds-leds-pca955x.c:warning:returning-void-from-a-function-with-return-type-int-makes-integer-from-pointer-without-a-cast
|-- hexagon-allmodconfig
|   |-- drivers-leds-leds-pca955x.c:error:incompatible-pointer-to-integer-conversion-returning-void-from-a-function-with-result-type-int
|   `-- drivers-leds-leds-pca955x.c:error:use-of-undeclared-identifier-client
|-- hexagon-randconfig-1000-20261106
|   |-- drivers-leds-leds-pca955x.c:error:incompatible-pointer-to-integer-conversion-returning-void-from-a-function-with-result-type-int
|   `-- drivers-leds-leds-pca955x.c:error:use-of-undeclared-identifier-client
|-- i386-allmodconfig
|   |-- drivers-leds-leds-pca955x.c:error:client-undeclared-(first-use-in-this-function)
|   `-- drivers-leds-leds-pca955x.c:error:returning-void-from-a-function-with-return-type-int-makes-integer-from-pointer-without-a-cast
|-- i386-allyesconfig
|   |-- drivers-leds-leds-pca955x.c:error:client-undeclared-(first-use-in-this-function)
|   `-- drivers-leds-leds-pca955x.c:error:returning-void-from-a-function-with-return-type-int-makes-integer-from-pointer-without-a-cast
|-- i386-buildonly-randconfig-1002-20261106
|   |-- drivers-leds-leds-pca955x.c:error:incompatible-pointer-to-integer-conversion-returning-void-from-a-function-with-result-type-int
|   `-- drivers-leds-leds-pca955x.c:error:use-of-undeclared-identifier-client
|-- i386-buildonly-randconfig-1005-20261106
|   |-- drivers-leds-leds-pca955x.c:error:incompatible-pointer-to-integer-conversion-returning-void-from-a-function-with-result-type-int
|   `-- drivers-leds-leds-pca955x.c:error:use-of-undeclared-identifier-client
|-- i386-randconfig-1001-20261106
|   |-- drivers-leds-leds-pca955x.c:error:incompatible-pointer-to-integer-conversion-returning-void-from-a-function-with-result-type-int
|   `-- drivers-leds-leds-pca955x.c:error:use-of-undeclared-identifier-client
|-- i386-randconfig-1002-20261106
|   |-- drivers-leds-leds-pca955x.c:error:incompatible-pointer-to-integer-conversion-returning-void-from-a-function-with-result-type-int
|   `-- drivers-leds-leds-pca955x.c:error:use-of-undeclared-identifier-client
|-- i386-randconfig-1003-20261106
|   |-- drivers-leds-leds-pca955x.c:error:incompatible-pointer-to-integer-conversion-returning-void-from-a-function-with-result-type-int
|   `-- drivers-leds-leds-pca955x.c:error:use-of-undeclared-identifier-client
|-- i386-randconfig-1005-20261106
|   |-- drivers-leds-leds-pca955x.c:error:incompatible-pointer-to-integer-conversion-returning-void-from-a-function-with-result-type-int
|   `-- drivers-leds-leds-pca955x.c:error:use-of-undeclared-identifier-client
|-- i386-randconfig-1007-20261106
|   |-- drivers-leds-leds-pca955x.c:error:incompatible-pointer-to-integer-conversion-returning-void-from-a-function-with-result-type-int
|   `-- drivers-leds-leds-pca955x.c:error:use-of-undeclared-identifier-client
|-- i386-randconfig-1008-20261106
|   |-- drivers-leds-leds-pca955x.c:error:incompatible-pointer-to-integer-conversion-returning-void-from-a-function-with-result-type-int
|   `-- drivers-leds-leds-pca955x.c:error:use-of-undeclared-identifier-client
|-- i386-randconfig-1009-20261106
|   |-- drivers-leds-leds-pca955x.c:error:client-undeclared-(first-use-in-this-function)
|   `-- drivers-leds-leds-pca955x.c:error:returning-void-from-a-function-with-return-type-int-makes-integer-from-pointer-without-a-cast
|-- i386-randconfig-1010-20261106
|   |-- drivers-leds-leds-pca955x.c:error:incompatible-pointer-to-integer-conversion-returning-void-from-a-function-with-result-type-int
|   `-- drivers-leds-leds-pca955x.c:error:use-of-undeclared-identifier-client
|-- i386-randconfig-1011-20261106
|   |-- drivers-leds-leds-pca955x.c:error:client-undeclared-(first-use-in-this-function)
|   `-- drivers-leds-leds-pca955x.c:error:returning-void-from-a-function-with-return-type-int-makes-integer-from-pointer-without-a-cast
|-- i386-randconfig-1012-20261106
|   |-- drivers-leds-leds-pca955x.c:error:client-undeclared-(first-use-in-this-function)
|   `-- drivers-leds-leds-pca955x.c:error:returning-void-from-a-function-with-return-type-int-makes-integer-from-pointer-without-a-cast
|-- loongarch-allmodconfig
|   |-- drivers-leds-leds-pca955x.c:error:incompatible-pointer-to-integer-conversion-returning-void-from-a-function-with-result-type-int
|   `-- drivers-leds-leds-pca955x.c:error:use-of-undeclared-identifier-client
|-- loongarch-randconfig-1000-20261106
|   |-- drivers-leds-leds-pca955x.c:error:client-undeclared-(first-use-in-this-function)
|   `-- drivers-leds-leds-pca955x.c:error:returning-void-from-a-function-with-return-type-int-makes-integer-from-pointer-without-a-cast
|-- loongarch-randconfig-1001-20261106
|   |-- drivers-leds-leds-pca955x.c:error:client-undeclared-(first-use-in-this-function)
|   `-- drivers-leds-leds-pca955x.c:error:returning-void-from-a-function-with-return-type-int-makes-integer-from-pointer-without-a-cast
|-- m68k-allmodconfig
|   |-- drivers-leds-leds-pca955x.c:error:client-undeclared-(first-use-in-this-function)
|   `-- drivers-leds-leds-pca955x.c:error:returning-void-from-a-function-with-return-type-int-makes-integer-from-pointer-without-a-cast
|-- m68k-allyesconfig
|   |-- drivers-leds-leds-pca955x.c:error:client-undeclared-(first-use-in-this-function)
|   `-- drivers-leds-leds-pca955x.c:error:returning-void-from-a-function-with-return-type-int-makes-integer-from-pointer-without-a-cast
|-- microblaze-allyesconfig
|   |-- drivers-leds-leds-pca955x.c:error:client-undeclared-(first-use-in-this-function)
|   `-- drivers-leds-leds-pca955x.c:error:returning-void-from-a-function-with-return-type-int-makes-integer-from-pointer-without-a-cast
|-- mips-allmodconfig
|   |-- drivers-leds-leds-pca955x.c:error:client-undeclared-(first-use-in-this-function)
|   `-- drivers-leds-leds-pca955x.c:error:returning-void-from-a-function-with-return-type-int-makes-integer-from-pointer-without-a-cast
|-- mips-allyesconfig
|   |-- drivers-leds-leds-pca955x.c:error:client-undeclared-(first-use-in-this-function)
|   `-- drivers-leds-leds-pca955x.c:error:returning-void-from-a-function-with-return-type-int-makes-integer-from-pointer-without-a-cast
|-- nios2-allmodconfig
|   |-- drivers-leds-leds-pca955x.c:error:client-undeclared-(first-use-in-this-function)
|   `-- drivers-leds-leds-pca955x.c:warning:returning-void-from-a-function-with-return-type-int-makes-integer-from-pointer-without-a-cast
|-- openrisc-allmodconfig
|   |-- drivers-leds-leds-pca955x.c:error:client-undeclared-(first-use-in-this-function)
|   `-- drivers-leds-leds-pca955x.c:error:returning-void-from-a-function-with-return-type-int-makes-integer-from-pointer-without-a-cast
|-- parisc-allmodconfig
|   |-- drivers-leds-leds-pca955x.c:error:client-undeclared-(first-use-in-this-function)
|   `-- drivers-leds-leds-pca955x.c:error:returning-void-from-a-function-with-return-type-int-makes-integer-from-pointer-without-a-cast
|-- parisc-allyesconfig
|   |-- drivers-leds-leds-pca955x.c:error:client-undeclared-(first-use-in-this-function)
|   `-- drivers-leds-leds-pca955x.c:error:returning-void-from-a-function-with-return-type-int-makes-integer-from-pointer-without-a-cast
|-- parisc-randconfig-1000-20261106
|   |-- drivers-leds-leds-pca955x.c:error:client-undeclared-(first-use-in-this-function)
|   `-- drivers-leds-leds-pca955x.c:warning:returning-void-from-a-function-with-return-type-int-makes-integer-from-pointer-without-a-cast
|-- parisc-randconfig-1001-20261106
|   |-- drivers-leds-leds-pca955x.c:error:client-undeclared-(first-use-in-this-function)
|   `-- drivers-leds-leds-pca955x.c:warning:returning-void-from-a-function-with-return-type-int-makes-integer-from-pointer-without-a-cast
|-- powerpc-allmodconfig
|   |-- drivers-leds-leds-pca955x.c:error:client-undeclared-(first-use-in-this-function)
|   `-- drivers-leds-leds-pca955x.c:error:returning-void-from-a-function-with-return-type-int-makes-integer-from-pointer-without-a-cast
|-- powerpc-xes_mpc85xx_defconfig
|   |-- drivers-leds-leds-pca955x.c:error:client-undeclared-(first-use-in-this-function)
|   `-- drivers-leds-leds-pca955x.c:error:returning-void-from-a-function-with-return-type-int-makes-integer-from-pointer-without-a-cast
|-- riscv-allmodconfig
|   |-- drivers-leds-leds-pca955x.c:error:incompatible-pointer-to-integer-conversion-returning-void-from-a-function-with-result-type-int
|   `-- drivers-leds-leds-pca955x.c:error:use-of-undeclared-identifier-client
|-- riscv-allyesconfig
|   |-- drivers-leds-leds-pca955x.c:error:incompatible-pointer-to-integer-conversion-returning-void-from-a-function-with-result-type-int
|   `-- drivers-leds-leds-pca955x.c:error:use-of-undeclared-identifier-client
|-- riscv-randconfig-1001-20261105
|   |-- drivers-leds-leds-pca955x.c:error:client-undeclared-(first-use-in-this-function)
|   `-- drivers-leds-leds-pca955x.c:warning:returning-void-from-a-function-with-return-type-int-makes-integer-from-pointer-without-a-cast
|-- s390-allmodconfig
|   |-- drivers-leds-leds-pca955x.c:error:incompatible-pointer-to-integer-conversion-returning-void-from-a-function-with-result-type-int
|   `-- drivers-leds-leds-pca955x.c:error:use-of-undeclared-identifier-client
|-- s390-allyesconfig
|   |-- drivers-leds-leds-pca955x.c:error:client-undeclared-(first-use-in-this-function)
|   `-- drivers-leds-leds-pca955x.c:error:returning-void-from-a-function-with-return-type-int-makes-integer-from-pointer-without-a-cast
|-- s390-randconfig-1000-20261106
|   |-- drivers-leds-leds-pca955x.c:error:client-undeclared-(first-use-in-this-function)
|   `-- drivers-leds-leds-pca955x.c:error:returning-void-from-a-function-with-return-type-int-makes-integer-from-pointer-without-a-cast
|-- s390-randconfig-1001-20261106
|   |-- drivers-leds-leds-pca955x.c:error:incompatible-pointer-to-integer-conversion-returning-void-from-a-function-with-result-type-int
|   `-- drivers-leds-leds-pca955x.c:error:use-of-undeclared-identifier-client
|-- sh-allmodconfig
|   |-- drivers-leds-leds-pca955x.c:error:client-undeclared-(first-use-in-this-function)
|   `-- drivers-leds-leds-pca955x.c:error:returning-void-from-a-function-with-return-type-int-makes-integer-from-pointer-without-a-cast
|-- sh-allyesconfig
|   |-- drivers-leds-leds-pca955x.c:error:client-undeclared-(first-use-in-this-function)
|   `-- drivers-leds-leds-pca955x.c:error:returning-void-from-a-function-with-return-type-int-makes-integer-from-pointer-without-a-cast
|-- sh-randconfig-1000-20261105
|   |-- drivers-leds-leds-pca955x.c:error:client-undeclared-(first-use-in-this-function)
|   `-- drivers-leds-leds-pca955x.c:warning:returning-void-from-a-function-with-return-type-int-makes-integer-from-pointer-without-a-cast
|-- sh-randconfig-1001-20261105
|   |-- drivers-leds-leds-pca955x.c:error:client-undeclared-(first-use-in-this-function)
|   `-- drivers-leds-leds-pca955x.c:error:returning-void-from-a-function-with-return-type-int-makes-integer-from-pointer-without-a-cast
|-- sparc64-allmodconfig
|   |-- drivers-leds-leds-pca955x.c:error:incompatible-pointer-to-integer-conversion-returning-void-from-a-function-with-result-type-int
|   `-- drivers-leds-leds-pca955x.c:error:use-of-undeclared-identifier-client
|-- sparc64-randconfig-1000-20261106
|   |-- drivers-leds-leds-pca955x.c:error:incompatible-pointer-to-integer-conversion-returning-void-from-a-function-with-result-type-int
|   `-- drivers-leds-leds-pca955x.c:error:use-of-undeclared-identifier-client
|-- sparc-randconfig-1000-20261106
|   |-- drivers-leds-leds-pca955x.c:error:client-undeclared-(first-use-in-this-function)
|   `-- drivers-leds-leds-pca955x.c:error:returning-void-from-a-function-with-return-type-int-makes-integer-from-pointer-without-a-cast
|-- sparc-randconfig-1001-20261106
|   |-- drivers-leds-leds-pca955x.c:error:client-undeclared-(first-use-in-this-function)
|   `-- drivers-leds-leds-pca955x.c:warning:returning-void-from-a-function-with-return-type-int-makes-integer-from-pointer-without-a-cast
|-- um-allmodconfig
|   |-- drivers-leds-leds-pca955x.c:error:incompatible-pointer-to-integer-conversion-returning-void-from-a-function-with-result-type-int
|   `-- drivers-leds-leds-pca955x.c:error:use-of-undeclared-identifier-client
|-- um-allyesconfig
|   |-- drivers-leds-leds-pca955x.c:error:client-undeclared-(first-use-in-this-function)
|   `-- drivers-leds-leds-pca955x.c:error:returning-void-from-a-function-with-return-type-int-makes-integer-from-pointer-without-a-cast
|-- um-randconfig-1001-20261106
|   |-- drivers-leds-leds-pca955x.c:error:incompatible-pointer-to-integer-conversion-returning-void-from-a-function-with-result-type-int
|   `-- drivers-leds-leds-pca955x.c:error:use-of-undeclared-identifier-client
|-- x86_64-allmodconfig
|   |-- drivers-leds-leds-pca955x.c:error:incompatible-pointer-to-integer-conversion-returning-void-from-a-function-with-result-type-int
|   `-- drivers-leds-leds-pca955x.c:error:use-of-undeclared-identifier-client
|-- x86_64-allyesconfig
|   |-- drivers-leds-leds-pca955x.c:error:incompatible-pointer-to-integer-conversion-returning-void-from-a-function-with-result-type-int
|   `-- drivers-leds-leds-pca955x.c:error:use-of-undeclared-identifier-client
|-- x86_64-buildonly-randconfig-1000-20261105
|   |-- drivers-leds-leds-pca955x.c:error:client-undeclared-(first-use-in-this-function)
|   `-- drivers-leds-leds-pca955x.c:error:returning-void-from-a-function-with-return-type-int-makes-integer-from-pointer-without-a-cast
|-- x86_64-buildonly-randconfig-1000-20261106
|   |-- drivers-leds-leds-pca955x.c:error:incompatible-pointer-to-integer-conversion-returning-void-from-a-function-with-result-type-int
|   `-- drivers-leds-leds-pca955x.c:error:use-of-undeclared-identifier-client
|-- x86_64-buildonly-randconfig-1002-20261105
|   |-- drivers-leds-leds-pca955x.c:error:incompatible-pointer-to-integer-conversion-returning-void-from-a-function-with-result-type-int
|   `-- drivers-leds-leds-pca955x.c:error:use-of-undeclared-identifier-client
|-- x86_64-buildonly-randconfig-1003-20261105
|   |-- drivers-leds-leds-pca955x.c:error:incompatible-pointer-to-integer-conversion-returning-void-from-a-function-with-result-type-int
|   `-- drivers-leds-leds-pca955x.c:error:use-of-undeclared-identifier-client
|-- x86_64-buildonly-randconfig-1004-20261106
|   |-- drivers-leds-leds-pca955x.c:error:incompatible-pointer-to-integer-conversion-returning-void-from-a-function-with-result-type-int
|   `-- drivers-leds-leds-pca955x.c:error:use-of-undeclared-identifier-client
|-- x86_64-buildonly-randconfig-1005-20261105
|   |-- drivers-leds-leds-pca955x.c:error:incompatible-pointer-to-integer-conversion-returning-void-from-a-function-with-result-type-int
|   `-- drivers-leds-leds-pca955x.c:error:use-of-undeclared-identifier-client
|-- x86_64-buildonly-randconfig-1005-20261106
|   |-- drivers-leds-leds-pca955x.c:error:incompatible-pointer-to-integer-conversion-returning-void-from-a-function-with-result-type-int
|   `-- drivers-leds-leds-pca955x.c:error:use-of-undeclared-identifier-client
|-- x86_64-randconfig-1002-20261106
|   |-- drivers-leds-leds-pca955x.c:error:incompatible-pointer-to-integer-conversion-returning-void-from-a-function-with-result-type-int
|   `-- drivers-leds-leds-pca955x.c:error:use-of-undeclared-identifier-client
|-- x86_64-randconfig-1004-20261106
|   |-- drivers-leds-leds-pca955x.c:error:incompatible-pointer-to-integer-conversion-returning-void-from-a-function-with-result-type-int
|   `-- drivers-leds-leds-pca955x.c:error:use-of-undeclared-identifier-client
|-- x86_64-randconfig-1006-20261106
|   |-- drivers-leds-leds-pca955x.c:error:client-undeclared-(first-use-in-this-function)
|   `-- drivers-leds-leds-pca955x.c:error:returning-void-from-a-function-with-return-type-int-makes-integer-from-pointer-without-a-cast
|-- x86_64-randconfig-1007-20261105
|   |-- drivers-leds-leds-pca955x.c:error:client-undeclared-(first-use-in-this-function)
|   `-- drivers-leds-leds-pca955x.c:error:returning-void-from-a-function-with-return-type-int-makes-integer-from-pointer-without-a-cast
|-- x86_64-randconfig-1007-20261106
|   |-- drivers-leds-leds-pca955x.c:error:client-undeclared-(first-use-in-this-function)
|   `-- drivers-leds-leds-pca955x.c:error:returning-void-from-a-function-with-return-type-int-makes-integer-from-pointer-without-a-cast
|-- x86_64-randconfig-1008-20261106
|   |-- drivers-leds-leds-pca955x.c:error:incompatible-pointer-to-integer-conversion-returning-void-from-a-function-with-result-type-int
|   `-- drivers-leds-leds-pca955x.c:error:use-of-undeclared-identifier-client
|-- x86_64-randconfig-1009-20261105
|   |-- drivers-leds-leds-pca955x.c:error:client-undeclared-(first-use-in-this-function)
|   `-- drivers-leds-leds-pca955x.c:error:returning-void-from-a-function-with-return-type-int-makes-integer-from-pointer-without-a-cast
|-- x86_64-randconfig-1009-20261106
|   |-- drivers-leds-leds-pca955x.c:error:client-undeclared-(first-use-in-this-function)
|   `-- drivers-leds-leds-pca955x.c:error:returning-void-from-a-function-with-return-type-int-makes-integer-from-pointer-without-a-cast
|-- x86_64-randconfig-1010-20261106
|   |-- drivers-leds-leds-pca955x.c:error:incompatible-pointer-to-integer-conversion-returning-void-from-a-function-with-result-type-int
|   `-- drivers-leds-leds-pca955x.c:error:use-of-undeclared-identifier-client
|-- x86_64-randconfig-1011-20261105
|   |-- drivers-leds-leds-pca955x.c:error:incompatible-pointer-to-integer-conversion-returning-void-from-a-function-with-result-type-int
|   `-- drivers-leds-leds-pca955x.c:error:use-of-undeclared-identifier-client
|-- x86_64-randconfig-1011-20261106
|   |-- drivers-leds-leds-pca955x.c:error:incompatible-pointer-to-integer-conversion-returning-void-from-a-function-with-result-type-int
|   `-- drivers-leds-leds-pca955x.c:error:use-of-undeclared-identifier-client
|-- x86_64-randconfig-1013-20261106
|   |-- drivers-leds-leds-pca955x.c:error:client-undeclared-(first-use-in-this-function)
|   `-- drivers-leds-leds-pca955x.c:warning:returning-void-from-a-function-with-return-type-int-makes-integer-from-pointer-without-a-cast
|-- x86_64-randconfig-1014-20261106
|   |-- drivers-leds-leds-pca955x.c:error:client-undeclared-(first-use-in-this-function)
|   `-- drivers-leds-leds-pca955x.c:warning:returning-void-from-a-function-with-return-type-int-makes-integer-from-pointer-without-a-cast
|-- x86_64-randconfig-1015-20261106
|   |-- drivers-leds-leds-pca955x.c:error:client-undeclared-(first-use-in-this-function)
|   `-- drivers-leds-leds-pca955x.c:error:returning-void-from-a-function-with-return-type-int-makes-integer-from-pointer-without-a-cast
|-- x86_64-randconfig-1016-20261106
|   |-- drivers-leds-leds-pca955x.c:error:client-undeclared-(first-use-in-this-function)
|   `-- drivers-leds-leds-pca955x.c:error:returning-void-from-a-function-with-return-type-int-makes-integer-from-pointer-without-a-cast
|-- x86_64-randconfig-1017-20261106
|   |-- drivers-leds-leds-pca955x.c:error:incompatible-pointer-to-integer-conversion-returning-void-from-a-function-with-result-type-int
|   `-- drivers-leds-leds-pca955x.c:error:use-of-undeclared-identifier-client
|-- xtensa-allyesconfig
|   |-- drivers-leds-leds-pca955x.c:error:client-undeclared-(first-use-in-this-function)
|   `-- drivers-leds-leds-pca955x.c:error:returning-void-from-a-function-with-return-type-int-makes-integer-from-pointer-without-a-cast
|-- xtensa-randconfig-1000-20261106
|   |-- drivers-leds-leds-pca955x.c:error:client-undeclared-(first-use-in-this-function)
|   `-- drivers-leds-leds-pca955x.c:warning:returning-void-from-a-function-with-return-type-int-makes-integer-from-pointer-without-a-cast
`-- xtensa-randconfig-1001-20261106
    |-- drivers-leds-leds-pca955x.c:error:client-undeclared-(first-use-in-this-function)
    `-- drivers-leds-leds-pca955x.c:error:returning-void-from-a-function-with-return-type-int-makes-integer-from-pointer-without-a-cast

elapsed time: 1420m

configs tested: 242
configs skipped: 14

tested configs:
alpha                              allnoconfig    gcc-16.2.0
alpha                             allyesconfig    gcc-16.2.0
alpha                                defconfig    gcc-16.2.0
arc                               allmodconfig    clang-24
arc                                allnoconfig    gcc-16.2.0
arc                               allyesconfig    clang-19
arc                               allyesconfig    clang-24
arc                               allyesconfig    gcc-16.2.0
arc                           axs103_defconfig    clang-19
arc                           axs103_defconfig    gcc-16.2.0
arc                                  defconfig    gcc-16.2.0
arc                   randconfig-1000-20261105    gcc-14.4.0
arc                   randconfig-1000-20261106    gcc-8.5.0
arc                   randconfig-1001-20261105    gcc-14.4.0
arc                   randconfig-1001-20261106    gcc-8.5.0
arc                         vdk_hs38_defconfig    clang-17
arm                                allnoconfig    gcc-16.2.0
arm                               allyesconfig    clang-24
arm                                  defconfig    gcc-16.2.0
arm                       integrator_defconfig    gcc-16.2.0
arm                          lpc32xx_defconfig    clang-17
arm                   randconfig-1000-20261105    gcc-14.4.0
arm                   randconfig-1000-20261106    gcc-8.5.0
arm                   randconfig-1001-20261105    gcc-14.4.0
arm                   randconfig-1001-20261106    gcc-8.5.0
arm                   randconfig-1002-20261105    gcc-14.4.0
arm                   randconfig-1002-20261106    gcc-8.5.0
arm                   randconfig-1003-20261105    gcc-14.4.0
arm                   randconfig-1003-20261106    gcc-8.5.0
arm                          s3c6400_defconfig    gcc-16.2.0
arm                        spear13xx_defconfig    gcc-16.2.0
arm                            sunxi_defconfig    clang-17
arm                            sunxi_defconfig    gcc-16.2.0
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.2.0
arm64                                defconfig    gcc-16.2.0
arm64                 randconfig-1000-20261106    clang-17
arm64                 randconfig-1001-20261106    clang-17
arm64                 randconfig-1002-20261106    clang-17
arm64                 randconfig-1003-20261106    clang-17
csky                              allmodconfig    gcc-16.2.0
csky                               allnoconfig    gcc-16.2.0
csky                                 defconfig    gcc-16.2.0
csky                  randconfig-1000-20261106    clang-17
csky                  randconfig-1001-20261106    clang-17
hexagon                           allmodconfig    gcc-16.2.0
hexagon                            allnoconfig    gcc-16.2.0
hexagon                              defconfig    gcc-16.2.0
hexagon               randconfig-1000-20261106    gcc-14.4.0
hexagon               randconfig-1001-20261106    gcc-14.4.0
i386                              allmodconfig    clang-22
i386                               allnoconfig    gcc-16.2.0
i386                              allyesconfig    clang-22
i386        buildonly-randconfig-1000-20261106    clang-22
i386        buildonly-randconfig-1001-20261106    clang-22
i386        buildonly-randconfig-1002-20261106    clang-22
i386        buildonly-randconfig-1003-20261106    clang-22
i386        buildonly-randconfig-1004-20261106    clang-22
i386        buildonly-randconfig-1005-20261106    clang-22
i386                                 defconfig    gcc-16.2.0
i386                  randconfig-1000-20261106    gcc-14
i386                  randconfig-1001-20261106    gcc-14
i386                  randconfig-1002-20261106    gcc-14
i386                  randconfig-1003-20261106    gcc-14
i386                  randconfig-1004-20261106    gcc-14
i386                  randconfig-1005-20261106    gcc-14
i386                  randconfig-1006-20261106    gcc-14
i386                  randconfig-1007-20261106    gcc-14
i386                  randconfig-1008-20261106    gcc-14
i386                  randconfig-1009-20261106    gcc-14
i386                  randconfig-1010-20261106    gcc-14
i386                  randconfig-1011-20261106    gcc-14
i386                  randconfig-1012-20261106    gcc-14
i386                  randconfig-1013-20261106    gcc-14
loongarch                         allmodconfig    clang-19
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    gcc-16.2.0
loongarch                            defconfig    clang-24
loongarch             randconfig-1000-20261106    gcc-14.4.0
loongarch             randconfig-1001-20261106    gcc-14.4.0
m68k                              allmodconfig    gcc-16.2.0
m68k                               allnoconfig    gcc-16.2.0
m68k                              allyesconfig    clang-24
m68k                           atari_defconfig    clang-17
m68k                                 defconfig    clang-24
m68k                         m5407c3_defconfig    gcc-16.2.0
m68k                       m54418evb_defconfig    clang-19
m68k                          nettel_defconfig    gcc-16.2.0
microblaze                         allnoconfig    gcc-16.2.0
microblaze                        allyesconfig    gcc-16.2.0
microblaze                           defconfig    clang-24
mips                              allmodconfig    gcc-16.2.0
mips                               allnoconfig    gcc-16.2.0
mips                              allyesconfig    gcc-16.2.0
mips                   cavium_octeon_defconfig    gcc-16.2.0
mips                           eyeq5_defconfig    clang-17
mips                           eyeq5_defconfig    gcc-16.2.0
mips                            ip28_defconfig    gcc-16.2.0
mips                       loongson3_defconfig    gcc-16.2.0
mips                 malta_qemu_32r6_defconfig    clang-17
mips                       maltasmvp_defconfig    gcc-16.2.0
mips                     maltaup_xpa_defconfig    clang-19
mips                            xway_defconfig    gcc-16.2.0
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20261106    gcc-14.4.0
nios2                 randconfig-1001-20261106    gcc-14.4.0
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc                    de0_nano_defconfig    clang-19
openrisc                             defconfig    gcc-16.2.0
openrisc                  simple_smp_defconfig    gcc-16.2.0
parisc                            allmodconfig    gcc-16.2.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.2.0
parisc                randconfig-1000-20261106    clang-19
parisc                randconfig-1001-20261106    clang-19
parisc64                             defconfig    clang-24
powerpc                           allmodconfig    gcc-16.2.0
powerpc                            allnoconfig    clang-24
powerpc                      ep8248e_defconfig    clang-17
powerpc                       ep88xc_defconfig    clang-17
powerpc                     gamecube_defconfig    clang-19
powerpc                       mgcoge_defconfig    clang-17
powerpc                      mpc512x_defconfig    gcc-16.2.0
powerpc                   mpc866_ads_defconfig    clang-17
powerpc                   mpc885_ads_defconfig    clang-19
powerpc                       pcm030_defconfig    gcc-16.2.0
powerpc               randconfig-1000-20261106    clang-19
powerpc               randconfig-1001-20261106    clang-19
powerpc                      tqm8555_defconfig    clang-19
powerpc                  xes_mpc85xx_defconfig    clang-17
powerpc64             randconfig-1000-20261106    clang-19
powerpc64             randconfig-1001-20261106    clang-19
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.2.0
riscv              nommu_k210_sdcard_defconfig    gcc-16.2.0
riscv                 randconfig-1000-20261105    clang-24
riscv                 randconfig-1000-20261106    gcc-14.4.0
riscv                 randconfig-1001-20261105    clang-24
riscv                 randconfig-1001-20261106    gcc-14.4.0
s390                              alldefconfig    clang-17
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.2.0
s390                                 defconfig    gcc-16.2.0
s390                  randconfig-1000-20261105    clang-24
s390                  randconfig-1000-20261106    gcc-14.4.0
s390                  randconfig-1001-20261105    clang-24
s390                  randconfig-1001-20261106    gcc-14.4.0
sh                                allmodconfig    gcc-16.2.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                                   defconfig    gcc-14
sh                              espt_defconfig    gcc-16.2.0
sh                  kfr2r09-romimage_defconfig    clang-17
sh                           polaris_defconfig    gcc-16.2.0
sh                    randconfig-1000-20261105    clang-24
sh                    randconfig-1000-20261106    gcc-14.4.0
sh                    randconfig-1001-20261105    clang-24
sh                    randconfig-1001-20261106    gcc-14.4.0
sh                           rsk7201_defconfig    clang-17
sh                         sh7757lcr_defconfig    gcc-16.2.0
sh                              shx3_defconfig    clang-17
sh                              shx3_defconfig    gcc-16.2.0
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.2.0
sparc                 randconfig-1000-20261106    gcc-15.3.0
sparc                 randconfig-1001-20261106    gcc-15.3.0
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20261106    gcc-15.3.0
sparc64               randconfig-1001-20261106    gcc-15.3.0
um                                alldefconfig    gcc-16.2.0
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.2.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20261106    gcc-15.3.0
um                    randconfig-1001-20261106    gcc-15.3.0
um                            x86_64_defconfig    gcc-14
x86_64                            alldefconfig    clang-19
x86_64                            allmodconfig    clang-22
x86_64                             allnoconfig    clang-24
x86_64                            allyesconfig    clang-22
x86_64      buildonly-randconfig-1000-20261105    gcc-14
x86_64      buildonly-randconfig-1000-20261106    gcc-13
x86_64      buildonly-randconfig-1001-20261105    gcc-14
x86_64      buildonly-randconfig-1001-20261106    gcc-13
x86_64      buildonly-randconfig-1002-20261105    gcc-14
x86_64      buildonly-randconfig-1002-20261106    gcc-13
x86_64      buildonly-randconfig-1003-20261105    gcc-14
x86_64      buildonly-randconfig-1003-20261106    gcc-13
x86_64      buildonly-randconfig-1004-20261105    gcc-14
x86_64      buildonly-randconfig-1004-20261106    gcc-13
x86_64      buildonly-randconfig-1005-20261105    gcc-14
x86_64      buildonly-randconfig-1005-20261106    gcc-13
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20261106    clang-22
x86_64                randconfig-1001-20261106    clang-22
x86_64                randconfig-1002-20261106    clang-22
x86_64                randconfig-1003-20261106    clang-22
x86_64                randconfig-1004-20261106    clang-22
x86_64                randconfig-1005-20261106    clang-22
x86_64                randconfig-1006-20261105    clang-22
x86_64                randconfig-1006-20261106    clang-22
x86_64                randconfig-1007-20261105    clang-22
x86_64                randconfig-1007-20261106    clang-22
x86_64                randconfig-1008-20261105    clang-22
x86_64                randconfig-1008-20261106    clang-22
x86_64                randconfig-1009-20261105    clang-22
x86_64                randconfig-1009-20261106    clang-22
x86_64                randconfig-1010-20261105    clang-22
x86_64                randconfig-1010-20261106    clang-22
x86_64                randconfig-1011-20261105    clang-22
x86_64                randconfig-1011-20261106    clang-22
x86_64                randconfig-1012-20261106    gcc-14
x86_64                randconfig-1013-20261106    gcc-14
x86_64                randconfig-1014-20261106    gcc-14
x86_64                randconfig-1015-20261106    gcc-14
x86_64                randconfig-1016-20261106    gcc-14
x86_64                randconfig-1017-20261106    gcc-14
x86_64                                rhel-9.4    clang-22
x86_64                            rhel-9.4-bpf    gcc-14
x86_64                           rhel-9.4-func    clang-22
x86_64                     rhel-9.4-kselftests    clang-22
x86_64                          rhel-9.4-kunit    gcc-14
x86_64                            rhel-9.4-ltp    gcc-14
x86_64                           rhel-9.4-rust    clang-22
xtensa                             allnoconfig    clang-24
xtensa                            allyesconfig    clang-20
xtensa                   nommu_kc705_defconfig    gcc-16.2.0
xtensa                randconfig-1000-20261106    gcc-15.3.0
xtensa                randconfig-1001-20261106    gcc-15.3.0
xtensa                     xip_kc705_defconfig    clang-17
xtensa                     xip_kc705_defconfig    gcc-16.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
