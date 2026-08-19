Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 007D3382283;
	Wed, 19 Aug 2026 20:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787173147; cv=none; b=Z0aR0zO89HCpi3p1OpopEfJnVRG4MeeGUZraXXjOZPPOscjvxE0w6qFjAwjQXPlJQ78hatHXk9WHlw2xZHw/CpxhkrZHmViSMO1yoG0AoHZ09iP5+U+ZsUPbVnkTCqtllRgWDrmXaI3tKP2NeoGo7kklmKntjnrGZT01KBLJUvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787173147; c=relaxed/simple;
	bh=ViIaFpCUQYsw3FMMwgjVBVSvigycBmJHQLE1t95qP9o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=utgf3MKzg5l8bXbvCENjggo6/lAv38AqURpQrJ1BuyAPiclQ35vn1ju8cH9mBZdhG+jwrfX61ntBD+PyHGQXzUPltxC6r2xFMsASo7vJzT6txAVHsdHoCEAu/OMutaLzCfqYbR/4L8neXlmFBh6MHoCX+0uhTu8sHWOxm6fMT3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kxSVZJZp; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kxSVZJZp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787173146; x=1818709146;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ViIaFpCUQYsw3FMMwgjVBVSvigycBmJHQLE1t95qP9o=;
  b=kxSVZJZpOkxT9dHGEGgWwjbkqGdV0Ilxt+ccbVHljKHNE510BmyHO1F3
   Nf1UWqXhon6K3IjGOsznglYNFTc2FEjxhJB6H/QbGwYjOST8wKQXYYdiL
   akibMmd/FvQunVv3UAf8vdJDyCwD9bdg5i41rL69tyaq0NPB6jyfP2DRQ
   2QnrYuzNDCDiXf5xq9vMMWx0Ew9QtzeqC6c5xoxwiBFRixYnYPftloeyK
   KhwVsP39h3SM5Bzf74qBlNF++GGb3J0sUeUHshVWU2AmbZbXbnoJ9niy4
   0z0xrtIcK/RLNkKEjhYBISGKbHllgZAaY6YimLAE/ltjZiE6GL3inQdFn
   Q==;
X-CSE-ConnectionGUID: RpLHmZ1WRUSaXHe07BHZfQ==
X-CSE-MsgGUID: Ad0WGJIrTT2xC+JIyRIl0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11880"; a="87561640"
X-IronPort-AV: E=Sophos;i="6.25,232,1779174000"; 
   d="scan'208";a="87561640"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2026 13:59:05 -0700
X-CSE-ConnectionGUID: aYskDuoqTCO2m7mfmp1lNQ==
X-CSE-MsgGUID: q3KjGVURQ4u22+ZBA+FESw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,232,1779174000"; 
   d="scan'208";a="267616788"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 19 Aug 2026 13:59:02 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wwnNE-00000000gSF-09x1;
	Wed, 19 Aug 2026 20:59:00 +0000
Date: Thu, 20 Aug 2026 04:58:07 +0800
From: kernel test robot <lkp@intel.com>
To: kr494167@gmail.com, lee@kernel.org, pavel@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, s.trumtrar@pengutronix.de,
	linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
	Surendra Singh Chouhan <kr494167@gmail.com>
Subject: Re: [PATCH v2] leds: lp5860: fix LED teardown ordering using
 devm_add_action_or_reset()
Message-ID: <202608200410.1YCGXTpW-lkp@intel.com>
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
[cannot apply to lee-leds/for-leds-next next-20260818]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/kr494167-gmail-com/leds-lp5860-fix-LED-teardown-ordering-using-devm_add_action_or_reset/20260806-202527
base:   linus/master
patch link:    https://lore.kernel.org/r/20260806145527.114844-1-kr494167%40gmail.com
patch subject: [PATCH v2] leds: lp5860: fix LED teardown ordering using devm_add_action_or_reset()
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20260820/202608200410.1YCGXTpW-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260820/202608200410.1YCGXTpW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608200410.1YCGXTpW-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/leds/rgb/leds-lp5860-spi.c: In function 'lp5860_probe':
>> drivers/leds/rgb/leds-lp5860-spi.c:64:9: error: 'ret' undeclared (first use in this function); did you mean 'net'?
      64 |         ret = devm_mutex_init(dev, &lp5860->lock);
         |         ^~~
         |         net
   drivers/leds/rgb/leds-lp5860-spi.c:64:9: note: each undeclared identifier is reported only once for each function it appears in


vim +64 drivers/leds/rgb/leds-lp5860-spi.c

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
