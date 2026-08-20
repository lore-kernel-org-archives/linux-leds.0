Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D8D73403E7;
	Thu, 20 Aug 2026 02:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787191540; cv=none; b=BPHbaWCpmmAkbK6vlkg999tru0kV4Skgt8Ri21tIN1x3fhwJQlxDud4iBUcm7B+ejevdZXVEEGGg2BROZRy5YJQeb95xcg4R4fySRovnNezczw/UM7bbvV0wkYsXGgfJW1oCHzrdk7maEAExQ2AATO8plYSyye/W2JbHKQ05GE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787191540; c=relaxed/simple;
	bh=eZof8aZ8q4tVXrn/BFEkdgapH7mPKs/TTA9SFcoW9h8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d5iOqC0Y9A7WPDepZpU0fExB9DWr4v7UNG6hEbXfXOCduHM+1OB+hPSHrG8+umX7nlc4ErNox124ZNrCHtevuCNvX6HlR6ejRG2yv/nSvJ7pbxFvaGdt0Jl+bZVq/cpj3TY5W/9Ih79lNSgd888K9eFuxxPgsg4wUb3dVMFYLIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ngztL/xY; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ngztL/xY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787191539; x=1818727539;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=eZof8aZ8q4tVXrn/BFEkdgapH7mPKs/TTA9SFcoW9h8=;
  b=ngztL/xYHdKOTpPyiOmc0sFUMA6fCaL1lvh2FLR1ZiMaS4cIlsdQ+Z2U
   iC2C0rDKv8hMCvNMYvJYFsbDADswGsL8tuf/Bpw65kGQLlX3RURwMThqt
   /2m8fdLTL9kM8vy1CMNtZ1wBaTMR+NkQVVJ3SlR1ltVUHDCm5MFeDqQ0L
   aUdinwLdFLCSisgFG+gl/IfAZ5DE25n+jK9UNNcY1LhvPQ2paGypj/Tj4
   UsndjxQvXpRoPUNJhmkh2X37Vq0RkVni4Ng3BVgfApHp4wuohFMvhV8RT
   0jMgmkIO01N2N3frSP8sW7wRsc2JAnUNSxeMnXsdgwhBKz+wMgUsjwFfQ
   g==;
X-CSE-ConnectionGUID: bhQSX3HFQKqbHfj4Z3rzBQ==
X-CSE-MsgGUID: xWnGogjdQ3KS2AeFzmoWTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11880"; a="99242972"
X-IronPort-AV: E=Sophos;i="6.25,232,1779174000"; 
   d="scan'208";a="99242972"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2026 19:05:38 -0700
X-CSE-ConnectionGUID: S7UXKfl6QU6gT6q0oHUivA==
X-CSE-MsgGUID: KoYFsN/vRNGgWrsL5EJSqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,232,1779174000"; 
   d="scan'208";a="264457691"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 19 Aug 2026 19:05:37 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wws9u-00000000hNB-2Bri;
	Thu, 20 Aug 2026 02:05:34 +0000
Date: Thu, 20 Aug 2026 10:05:24 +0800
From: kernel test robot <lkp@intel.com>
To: kr494167@gmail.com, lee@kernel.org, pavel@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, s.trumtrar@pengutronix.de,
	linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
	Surendra Singh Chouhan <kr494167@gmail.com>
Subject: Re: [PATCH v2] leds: lp5860: fix LED teardown ordering using
 devm_add_action_or_reset()
Message-ID: <202608200947.afKbW4ug-lkp@intel.com>
References: <20260806145527.114844-1-kr494167@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260806145527.114844-1-kr494167@gmail.com>

Hi,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v7.2]
[cannot apply to lee-leds/for-leds-next next-20260819]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/kr494167-gmail-com/leds-lp5860-fix-LED-teardown-ordering-using-devm_add_action_or_reset/20260806-202527
base:   linus/master
patch link:    https://lore.kernel.org/r/20260806145527.114844-1-kr494167%40gmail.com
patch subject: [PATCH v2] leds: lp5860: fix LED teardown ordering using devm_add_action_or_reset()
config: sparc64-randconfig-r071-20260820 (https://download.01.org/0day-ci/archive/20260820/202608200947.afKbW4ug-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 844a18e753e822736c9805ab779144b647a2c186)
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260820/202608200947.afKbW4ug-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608200947.afKbW4ug-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/leds/rgb/leds-lp5860-spi.c:64:2: error: use of undeclared identifier 'ret'
      64 |         ret = devm_mutex_init(dev, &lp5860->lock);
         |         ^~~
   drivers/leds/rgb/leds-lp5860-spi.c:65:6: error: use of undeclared identifier 'ret'
      65 |         if (ret)
         |             ^~~
   drivers/leds/rgb/leds-lp5860-spi.c:65:6: error: use of undeclared identifier 'ret'
      65 |         if (ret)
         |             ^~~
   drivers/leds/rgb/leds-lp5860-spi.c:65:6: error: use of undeclared identifier 'ret'
      65 |         if (ret)
         |             ^~~
   drivers/leds/rgb/leds-lp5860-spi.c:66:10: error: use of undeclared identifier 'ret'
      66 |                 return ret;
         |                        ^~~
   5 errors generated.


vim +/ret +64 drivers/leds/rgb/leds-lp5860-spi.c

    35	
    36	static int lp5860_probe(struct spi_device *spi)
    37	{
    38		struct device *dev = &spi->dev;
    39		struct lp5860 *lp5860;
    40		unsigned int multi_leds;
    41	
    42		multi_leds = device_get_child_node_count(dev);
    43		if (!multi_leds) {
    44			dev_err(dev, "LEDs are not defined in Device Tree!");
    45			return -ENODEV;
    46		}
    47	
    48		if (multi_leds > LP5860_MAX_LED) {
    49			dev_err(dev, "Too many LEDs specified.\n");
    50			return -EINVAL;
    51		}
    52	
    53		lp5860 = devm_kzalloc(dev, struct_size(lp5860, leds, multi_leds),
    54				      GFP_KERNEL);
    55		if (!lp5860)
    56			return -ENOMEM;
    57	
    58		lp5860->regmap = devm_regmap_init_spi(spi, &lp5860_regmap_config);
    59		if (IS_ERR(lp5860->regmap))
    60			return dev_err_probe(&spi->dev, PTR_ERR(lp5860->regmap),
    61					     "Failed to initialise Regmap.\n");
    62	
    63		lp5860->dev = dev;
  > 64		ret = devm_mutex_init(dev, &lp5860->lock);
    65		if (ret)
    66			return ret;
    67	
    68		spi_set_drvdata(spi, lp5860);
    69	
    70		return lp5860_device_init(dev);
    71	}
    72	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
