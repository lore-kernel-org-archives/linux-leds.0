Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 918ED40E8FC
	for <linux-leds@vger.kernel.org>; Fri,  5 Jun 2026 13:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780666006; cv=none; b=M7X2QZv2gStBSb2vX2ECvc2KHLrbutLLG4WH+KPmz/h79mzM3b9b31VQ/1Q99FgbjXunxnygYfwrZMjy6owNhqiluqcfgBSg+f+7swhqO/uW9l854BLFiCu8vWsFiFZzdEQOPgIvSbFzjyVKAOv8olkZVkHTFgPIX9cDCjN0flE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780666006; c=relaxed/simple;
	bh=+zHVsAlXHiwXej9hAwMiT1Bmsu7hhvhmfPp8qE5YiU4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=SKgKywsyjf6cCKTFUuhEr6SpUyLqz3NclLyyffWDlRM7e4u8Nccw+DXIQ87l6853r0kbmzKVIAn/sGjEAJa7LnmJvjY8ReFvA9G6AIXSuPZzSwjlLqSjTjoumw+RCyL0gmL8qFgKQIZ0yA7NFRhPcRo+ARAkBT5qzPOCn5QQMFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hilvlboa; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hilvlboa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780666005; x=1812202005;
  h=date:from:to:cc:subject:message-id;
  bh=+zHVsAlXHiwXej9hAwMiT1Bmsu7hhvhmfPp8qE5YiU4=;
  b=hilvlboaWblXe6GW0vwJ4oadkiyByj79y6KZUks0DfBo41guVKtCqQ3w
   noETOMeJX+s//8c5I+Sp9sq6yU5XcoOZ6PCew5F9MRJCaiL+oZP5sztKD
   0TNwjA0vtBVBCPnr/9EM2j3LQ8mxSVJQ/SGJnOIAv7S7fSToql6me8WS3
   qMtQKodxUOyx/4qFyNaZ0dcKAKiMNeV9moz1lbJbbtoQe8xCRGPcGmGTx
   qxFgBxOOhX4y6gmN6B00YBMFx2hqJH5mKrt40QumMHTXTwQlX0mkypAWk
   P8/OqCijUdA7vjcGwvpq6IFKsNI9KgTSD/h7GXxC1+F1s0mgAOsYKcyXj
   Q==;
X-CSE-ConnectionGUID: 90q/uWFMRhubCxz/Adlp8A==
X-CSE-MsgGUID: 6II3mTcOT8SHg4VgQfyLAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11807"; a="92873183"
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; 
   d="scan'208";a="92873183"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2026 06:26:44 -0700
X-CSE-ConnectionGUID: xnzlRfy5TryA0IqsCDtR5w==
X-CSE-MsgGUID: Hp3ZWmsWSECO8vUs+l+ROA==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 05 Jun 2026 06:26:42 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wVUZM-00000000G2g-0hE6;
	Fri, 05 Jun 2026 13:26:40 +0000
Date: Fri, 05 Jun 2026 21:25:59 +0800
From: kernel test robot <lkp@intel.com>
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-leds@vger.kernel.org,
 Lee Jones <lee@kernel.org>
Subject: [lee-leds:for-leds-next 20/28]
 drivers/leds/flash/leds-s2m-flash.c:12:10: fatal error:
 linux/mfd/samsung/s2mu005.h: No such file or directory
Message-ID: <202606052113.SVU1F2CZ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git for-leds-next
head:   a2263676302a4eec40af93b3829f1d3d5aade93c
commit: f0878c58430c378c47aaece1b29484e4ae8d7faf [20/28] leds: flash: Add support for Samsung S2M series PMIC flash LED device
config: microblaze-randconfig-r073-20260605 (https://download.01.org/0day-ci/archive/20260605/202606052113.SVU1F2CZ-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 9.5.0
smatch: v0.5.0-9185-gbcc58b9c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260605/202606052113.SVU1F2CZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606052113.SVU1F2CZ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/leds/flash/leds-s2m-flash.c:12:10: fatal error: linux/mfd/samsung/s2mu005.h: No such file or directory
      12 | #include <linux/mfd/samsung/s2mu005.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   compilation terminated.


vim +12 drivers/leds/flash/leds-s2m-flash.c

  > 12	#include <linux/mfd/samsung/s2mu005.h>
    13	#include <linux/module.h>
    14	#include <linux/of.h>
    15	#include <linux/platform_device.h>
    16	#include <linux/regmap.h>
    17	#include <media/v4l2-flash-led-class.h>
    18	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
