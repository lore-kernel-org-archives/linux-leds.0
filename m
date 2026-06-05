Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7D8E3B8958
	for <linux-leds@vger.kernel.org>; Fri,  5 Jun 2026 16:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780675496; cv=none; b=sBd65Yy7LxkuUP+VjBPrME9OeS1D0w5ivVnTOX3B3CuD0Y/4agWUPLFdceqNVxiKXfxOn8jn6w/I0WEl59ZlBjmx5bX0f8ctJ3JTptDSgAkC91kjZo2NIuwz9ysSN/kufexGTk91AAslF1La/KSUMPvRisCRNqzxNl+AJUPAz/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780675496; c=relaxed/simple;
	bh=7YRovzqhtQWhqyaUemtxUz48deQGxS6GpTQpH7wejM0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=epslvMR0AHI6gYUXDCDkx2VUJD1oaXnFId4ZoeCUg7w2wswfD9+BFsp04PB8lrQtGhAJSheEP3EEWA0aBPycXejf2hw0KIood4JB3N8VnaGs1765WkQq0WSBsMAw3/JYpOR055nUYbSCw1FDdFnkLkAX0wFx1hcbwLVAcwnsqvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BNfp0Flp; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BNfp0Flp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780675494; x=1812211494;
  h=date:from:to:cc:subject:message-id;
  bh=7YRovzqhtQWhqyaUemtxUz48deQGxS6GpTQpH7wejM0=;
  b=BNfp0FlpIztbMIF16I235az6n57MW5fwq8ieIe27W3ZA5edCZSyv7HD2
   UTEdGrLLutdE+2iU3gIesvMHVWnjoV4ATBtjuGPKJANAhl6sJQlkIQXcB
   UL48lfCiml1r4G+gKanklm7wUV5DDq6w3bCGzMmh/MHHyFrpK6arqn/aD
   S2vNHSYUWUPc5by3xCPcq2+B4d0E8uMQhLdcLziTD1z662oFcjDgsQ/Db
   nvbVp9/Q3kuj4QvkVth+xzbYWx8Ug+IaYCtL5Skv6R6yKBS/viyhRPiWH
   ltGc2t6QQPvpi9C/pHMtVDqec3BBhmThEqCLsg1ZwByp8pG+p/zJWIp+B
   w==;
X-CSE-ConnectionGUID: ZL+jRBKvSDSucmRieCDm6Q==
X-CSE-MsgGUID: q+8E/BEtS560PzTDPxpjig==
X-IronPort-AV: E=McAfee;i="6800,10657,11808"; a="69042513"
X-IronPort-AV: E=Sophos;i="6.24,189,1774335600"; 
   d="scan'208";a="69042513"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2026 09:04:54 -0700
X-CSE-ConnectionGUID: 6kKwHVUHR7yviWz3ovCr3Q==
X-CSE-MsgGUID: ja7WdAdDSH+juScXa14FrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,189,1774335600"; 
   d="scan'208";a="246703931"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 05 Jun 2026 09:04:52 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wVX2Q-00000000GCk-0I5v;
	Fri, 05 Jun 2026 16:04:50 +0000
Date: Sat, 06 Jun 2026 00:04:32 +0800
From: kernel test robot <lkp@intel.com>
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-leds@vger.kernel.org, Lee Jones <lee@kernel.org>
Subject: [lee-leds:for-leds-next 21/28]
 drivers/leds/rgb/leds-s2m-rgb.c:12:10: fatal error:
 'linux/mfd/samsung/s2mu005.h' file not found
Message-ID: <202606052337.5WHsvu5q-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git for-leds-next
head:   a2263676302a4eec40af93b3829f1d3d5aade93c
commit: 366ed7a6d22e682e6dfd4d64d8f543bc70c6b58e [21/28] leds: rgb: Add support for Samsung S2M series PMIC RGB LED device
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260605/202606052337.5WHsvu5q-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260605/202606052337.5WHsvu5q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606052337.5WHsvu5q-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/leds/rgb/leds-s2m-rgb.c:12:10: fatal error: 'linux/mfd/samsung/s2mu005.h' file not found
      12 | #include <linux/mfd/samsung/s2mu005.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +12 drivers/leds/rgb/leds-s2m-rgb.c

  > 12	#include <linux/mfd/samsung/s2mu005.h>
    13	#include <linux/minmax.h>
    14	#include <linux/module.h>
    15	#include <linux/mutex.h>
    16	#include <linux/of.h>
    17	#include <linux/platform_device.h>
    18	#include <linux/regmap.h>
    19	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
