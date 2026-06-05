Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58D2B35CB6A
	for <linux-leds@vger.kernel.org>; Fri,  5 Jun 2026 14:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780670390; cv=none; b=vDBc1qDiJP+eifvo3GhNrjqETdmUEZClWmyTwjVmUqXvg94k9xmihIiyVPbw1CL6e1SNY3IUJ+f6kHYYaCp8orEIqbfea58rJtvCJGF3Hfrl3u5X+HbA4jQkyFciCdDkbIW6H3YkmIgx/zpBF9nT6njnRFtuTTS/1h/+9zmp6Ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780670390; c=relaxed/simple;
	bh=ecDNEYeL7Zo4XUl6n+Nj/B51f2QqerN16IJVVJauoy8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=X/7ONXiVJkD8CXNn7K4R884JoPE2geNTJibA0VMrEBy22HnedEvyaO+9zvaBYyCdEFMmueyKcW09A3vIMumrLSg00lGsNznzB4zGXuog+un1PSBsiUbyaUkNQr8tJFIb3brdZZ1Cakr8+fHPd3gv7bEIv19pjdWB9sxiMoCGwyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GRsFLFn+; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GRsFLFn+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780670390; x=1812206390;
  h=date:from:to:cc:subject:message-id;
  bh=ecDNEYeL7Zo4XUl6n+Nj/B51f2QqerN16IJVVJauoy8=;
  b=GRsFLFn+gQNIWWDMda/+hZaW750qXCUfbq7QJ51b75WaYYwa2Ed3iN6j
   q6CNF7Novn7VXnBbS0mEE4BjDWu63ZLJfvtDWdGUk46vC4ag2ashGZOSz
   fsvof0EKJENuyn74l5vsrFJnFAaRVB7naAoYFyqBNsY5Zt2QmNSWOgCBC
   h5DQjUFN2q9+BmyFbiOUQsU4udEViASA71MyhYjjC+4RP9yivRK+nkmQ9
   rqOxXZKLGeoJ4WV4SMjyt9KCCj6/Ovn7zjOu2aq3WG4zNevOmhyn17n/T
   b2nY3Totd+y1oklZvXqjgJ8uTpXjW6/dUmsTVpv+RwNVn9X2GVXc6Be85
   A==;
X-CSE-ConnectionGUID: FzhJd6b5TKyIOXkP12IFaQ==
X-CSE-MsgGUID: lavKEEUdQhKnUsV04UZ38g==
X-IronPort-AV: E=McAfee;i="6800,10657,11807"; a="81502967"
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; 
   d="scan'208";a="81502967"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2026 07:39:49 -0700
X-CSE-ConnectionGUID: bOzb2OOuSquxRZi5/r0GCA==
X-CSE-MsgGUID: 7JKQD2noS5CKzVg4vT2TJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; 
   d="scan'208";a="249786909"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 05 Jun 2026 07:39:47 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wVVi4-00000000G84-1qnj;
	Fri, 05 Jun 2026 14:39:44 +0000
Date: Fri, 05 Jun 2026 22:39:36 +0800
From: kernel test robot <lkp@intel.com>
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-leds@vger.kernel.org, Lee Jones <lee@kernel.org>
Subject: [lee-leds:for-leds-next 20/28]
 drivers/leds/flash/leds-s2m-flash.c:12:10: fatal error:
 'linux/mfd/samsung/s2mu005.h' file not found
Message-ID: <202606052213.CzcS7Ap7-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git for-leds-next
head:   a2263676302a4eec40af93b3829f1d3d5aade93c
commit: f0878c58430c378c47aaece1b29484e4ae8d7faf [20/28] leds: flash: Add support for Samsung S2M series PMIC flash LED device
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260605/202606052213.CzcS7Ap7-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260605/202606052213.CzcS7Ap7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606052213.CzcS7Ap7-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/leds/flash/leds-s2m-flash.c:12:10: fatal error: 'linux/mfd/samsung/s2mu005.h' file not found
      12 | #include <linux/mfd/samsung/s2mu005.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


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
