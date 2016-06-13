From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [j.anaszewski-leds:for-next 4/4]
 drivers/leds/leds-pca9532.c:464:10: warning: cast from pointer to integer of
 different size
Date: Mon, 13 Jun 2016 13:47:13 +0200
Message-ID: <575E9D41.4020204@samsung.com>
References: <201606131855.06gV7Rp0%fengguang.wu@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:23556 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1422869AbcFMLrR (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 13 Jun 2016 07:47:17 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0O8P007G4KQQ3T40@mailout2.w1.samsung.com> for
 linux-leds@vger.kernel.org; Mon, 13 Jun 2016 12:47:14 +0100 (BST)
In-reply-to: <201606131855.06gV7Rp0%fengguang.wu@intel.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Phil Reid <preid@electromag.com.au>
Cc: kbuild test robot <fengguang.wu@intel.com>, linux-leds@vger.kernel.org

Hi Phil,

Please cast to uintptr_t instead of int.

Besides, pca9532_of_populate_pdata() is local, please add 'static'
modifier to its definition.

For now, I'm dropping the patch.

Thanks,
Jacek Anaszewski

On 06/13/2016 12:27 PM, kbuild test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/j.anaszewski/linux-leds for-next
> head:   fa50a4fde61a4620ecbfac6f51be3913a6800bb7
> commit: fa50a4fde61a4620ecbfac6f51be3913a6800bb7 [4/4] leds: pca9532: Add device tree binding
> config: sparc64-allyesconfig (attached as .config)
> compiler: sparc64-linux-gnu-gcc (Debian 5.3.1-8) 5.3.1 20160205
> reproduce:
>          wget https://git.kernel.org/cgit/linux/kernel/git/wfg/lkp-tests.git/plain/sbin/make.cross -O ~/bin/make.cross
>          chmod +x ~/bin/make.cross
>          git checkout fa50a4fde61a4620ecbfac6f51be3913a6800bb7
>          # save the attached .config to linux build tree
>          make.cross ARCH=sparc64
>
> All warnings (new ones prefixed by >>):
>
>     drivers/leds/leds-pca9532.c: In function 'pca9532_of_populate_pdata':
>>> drivers/leds/leds-pca9532.c:464:10: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
>       devid = (int)match->data;
>               ^
>     drivers/leds/leds-pca9532.c: In function 'pca9532_probe':
>     drivers/leds/leds-pca9532.c:506:11: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
>        devid = (int)of_match_device(
>                ^
>
> vim +464 drivers/leds/leds-pca9532.c
>
>     448		return err;
>     449	}
>     450	
>     451	struct pca9532_platform_data *pca9532_of_populate_pdata(struct device *dev,
>     452							      struct device_node *np)
>     453	{
>     454		struct pca9532_platform_data *pdata;
>     455		struct device_node *child;
>     456		const struct of_device_id *match;
>     457		int devid, maxleds;
>     458		int i = 0;
>     459	
>     460		match = of_match_device(of_pca9532_leds_match, dev);
>     461		if (!match)
>     462			return ERR_PTR(-ENODEV);
>     463	
>   > 464		devid = (int)match->data;
>     465		maxleds = pca9532_chip_info_tbl[devid].num_leds;
>     466	
>     467		pdata = devm_kzalloc(dev, sizeof(*pdata), GFP_KERNEL);
>     468		if (!pdata)
>     469			return ERR_PTR(-ENOMEM);
>     470	
>     471		for_each_child_of_node(np, child) {
>     472			if (of_property_read_string(child, "label",
>
> ---
> 0-DAY kernel test infrastructure                Open Source Technology Center
> https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
>


-- 
Best regards,
Jacek Anaszewski
