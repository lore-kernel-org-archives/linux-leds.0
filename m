Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793891906;
	b=V+nwKpZrJ1sKmzkgdCjSDdv8xYsUkdhwNRyIuM3Rja0+J18QC2zlBjHaqb7F7XWQfRuq
	 YuncWUIhTxGKm+N5b2D+U/lmxdyxRJXN6aRzBuMuemj2SsCXeC8DnyIj9DiE93M22ZZbX
	 Iv9SZ1jO5wmaDgQWVg/MXD5Ivsj1le4thGhpS6auSjWMk7VPgg56SF8WuKrQibrxIC0GI
	 6wRiyRiDlxzsEpkigosH82MKFqZ8sgqXk1yMGlo1Jvw+RCV0DM7iDORXM19jMSNPjQWUh
	 Ry6Uv0U9CKIWmjm9+qQnGdaf/d8tj3aeWvASsOXNR1jwsbqMoa89jP8KcXoeLRuU8hw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793891906;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=eScw/QMwk/DH9XwpV7wMxNexoTJvnWrPKCEp+SvkiII=;
	b=b2CkzuNIwAOVDimEjqkMWptAOgIei15qHgyz8UBXvOSAmj85P3Lv27m09ZZ9XZr5YVO/
	 0rhkwjyLmwJ9Pk0jRMr0y5qaA/6Zi5N+m1Ca7yL6ezMWcM3Mj+FLNkMMomu+hYvBLC8eR
	 zFex4pHybnIDdioF8dIF44VkQW0Ljqci3NEB6p2uY9DELSgZc+WVx05scJSpCXih8FuvM
	 ZI870jzIfKtSNUgGrXcJjB4oiDHXWLbgQBrM8He7339F2OFlUz8UraBLucm4ysjg33d7d
	 yOAWkRki2mTGYj0c7/VhM8MWndm4pPvPQxF2j7hVbhvOvdJIBm4SBpfAXkSBkpP8uuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SSO7rVxX;
	arc=none smtp.remote-ip=198.175.65.18
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9455606EE85
	for <linux-leds@vger.kernel.org>; Thu,  5 Nov 2026 15:18:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9455606EE85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SSO7rVxX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793891904; x=1825427904;
  h=date:from:to:cc:subject:message-id;
  bh=/SMjuTkUqgIMDWm9TEEBLtms/3Bsq4CsGJZio7BHoGI=;
  b=SSO7rVxXaNJH/QIJCd9KkjgR1iUQ/+Cj8sGAfdm2LVEx6dW3XYsblcZh
   hb0rUxo7IQEyEAfAvz7A96qcD3L5azizne23Ha2NOaIm42gEkVrvlyzlf
   f8/WoEImpRHgL7iJ3HpJ0TWsjmx+1hfSlLzw1l2n7MSlR0CXpFpJ5Ws+J
   3DvwV8UiXTsCvy+wypOiHlEK/WSbm+G0Ubx4ur+pLFvZ5PySF06ZqGhG0
   Lg9BoXn6O9WpyVbSp/MtpKUo6Kd//Mo02kf59buVL7TW1b6AFBDKfT18T
   kT4g4AhFr7FLlxnepLaHCt2FBrmbRJVfyOc/ds/2oD7tOhhp+0mxqwS4H
   A==;
X-CSE-ConnectionGUID: zE9yblyCQ3CELWZWrkxM2Q==
X-CSE-MsgGUID: PKoeKJW5TEuckWFrAeOEVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2701113"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2701113"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 07:18:24 -0800
X-CSE-ConnectionGUID: kfjaD/4+QwSJMy/MRhdTrA==
X-CSE-MsgGUID: gUmL6+jURdGy41Fb5rM/gA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="8790287"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa012.fm.intel.com with ESMTP; 05 Nov 2026 07:18:22 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xOzEI-000000009gB-4Bj7;
	Thu, 05 Nov 2026 15:18:19 +0000
Date: Thu, 05 Nov 2026 16:17:57 +0100
From: kernel test robot <lkp@intel.com>
To: Lee Jones <lee@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-leds@vger.kernel.org
Subject: [lee-leds:for-leds-next 18/34]
 drivers/leds/leds-pca955x.c:544:37: error: use of undeclared identifier
 'client'
Message-ID: <202611051650.vcD7uJMK-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git for-leds-next
head:   a379f4e0adf2de7b11aa3ef87eeb7d9c838069b3
commit: abeb74220fefe28ab68789659f554f49e3b4a51e [18/34] leds: pca955x: Take a reference on the child firmware node
config: hexagon-randconfig-2200-20261105 (https://download.01.org/0day-ci/archive/20261105/202611051650.vcD7uJMK-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261105/202611051650.vcD7uJMK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611051650.vcD7uJMK-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/leds/leds-pca955x.c:544:37: error: use of undeclared identifier 'client'
     544 |         device_for_each_child_node_scoped(&client->dev, child) {
         |                                            ^
>> drivers/leds/leds-pca955x.c:544:37: error: use of undeclared identifier 'client'
   drivers/leds/leds-pca955x.c:554:25: error: use of undeclared identifier 'client'
     554 |                         devm_release_action(&client->dev, pca955x_fwnode_put,
         |                                              ^
   drivers/leds/leds-pca955x.c:559:35: error: use of undeclared identifier 'client'
     559 |                 res = devm_add_action_or_reset(&client->dev,
         |                                                 ^
>> drivers/leds/leds-pca955x.c:562:11: error: incompatible pointer to integer conversion returning 'void *' from a function with result type 'int' [-Wint-conversion]
     562 |                         return ERR_PTR(res);
         |                                ^~~~~~~~~~~~
   5 errors generated.


vim +/client +544 drivers/leds/leds-pca955x.c

   532	
   533	static int pca955x_parse_fwnode(struct pca955x *pca955x)
   534	{
   535		struct device *dev = &pca955x->client->dev;
   536		u8 bits = pca955x->chipdef->bits;
   537		struct pca955x_led *led;
   538		int count;
   539	
   540		count = device_get_child_node_count(dev);
   541		if (count > bits)
   542			return -ENODEV;
   543	
 > 544		device_for_each_child_node_scoped(&client->dev, child) {
   545			u32 reg;
   546			int res;
   547	
   548			res = fwnode_property_read_u32(child, "reg", &reg);
   549			if ((res != 0) || (reg >= bits))
   550				continue;
   551	
   552			led = &pca955x->leds[reg];
   553			if (led->fwnode)
   554				devm_release_action(&client->dev, pca955x_fwnode_put,
   555						    led->fwnode);
   556			led->type = PCA955X_TYPE_LED;
   557			led->fwnode = fwnode_handle_get(child);
   558	
   559			res = devm_add_action_or_reset(&client->dev,
   560						       pca955x_fwnode_put, led->fwnode);
   561			if (res)
 > 562				return ERR_PTR(res);
   563	
   564			led->default_state = led_init_default_state_get(child);
   565	
   566			fwnode_property_read_u32(child, "type", &led->type);
   567		}
   568	
   569		return 0;
   570	}
   571	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
