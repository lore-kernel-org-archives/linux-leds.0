From: Phil Reid <preid@electromag.com.au>
Subject: Re: [j.anaszewski-leds:for-next 4/4]
 drivers/leds/leds-pca9532.c:464:10: warning: cast from pointer to integer of
 different size
Date: Tue, 14 Jun 2016 15:31:35 +0800
Message-ID: <1136327c-8138-98dc-ae21-372491e59476@electromag.com.au>
References: <201606131855.06gV7Rp0%fengguang.wu@intel.com>
 <575E9D41.4020204@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from anchovy1.45ru.net.au ([203.30.46.145]:41855 "EHLO
	anchovy.45ru.net.au" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1751475AbcFNHiT (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 14 Jun 2016 03:38:19 -0400
In-Reply-To: <575E9D41.4020204@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: kbuild test robot <fengguang.wu@intel.com>, linux-leds@vger.kernel.org

On 13/06/2016 19:47, Jacek Anaszewski wrote:
> Hi Phil,
>
> Please cast to uintptr_t instead of int.
>
> Besides, pca9532_of_populate_pdata() is local, please add 'static'
> modifier to its definition.
>

PATCH v5 sent addressing the issues.

> For now, I'm dropping the patch.
>
> Thanks,
> Jacek Anaszewski
>
> On 06/13/2016 12:27 PM, kbuild test robot wrote:
>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/j.anaszewski/linux-leds for-next
>> head:   fa50a4fde61a4620ecbfac6f51be3913a6800bb7
>> commit: fa50a4fde61a4620ecbfac6f51be3913a6800bb7 [4/4] leds: pca9532: Add device tree binding
>> config: sparc64-allyesconfig (attached as .config)
>> compiler: sparc64-linux-gnu-gcc (Debian 5.3.1-8) 5.3.1 20160205
>> reproduce:
>>          wget https://git.kernel.org/cgit/linux/kernel/git/wfg/lkp-tests.git/plain/sbin/make.cross -O ~/bin/make.cross
>>          chmod +x ~/bin/make.cross
>>          git checkout fa50a4fde61a4620ecbfac6f51be3913a6800bb7
>>          # save the attached .config to linux build tree
>>          make.cross ARCH=sparc64
>>
>> All warnings (new ones prefixed by >>):
>>
>>     drivers/leds/leds-pca9532.c: In function 'pca9532_of_populate_pdata':
>>>> drivers/leds/leds-pca9532.c:464:10: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
>>       devid = (int)match->data;
>>               ^
>>     drivers/leds/leds-pca9532.c: In function 'pca9532_probe':
>>     drivers/leds/leds-pca9532.c:506:11: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
>>        devid = (int)of_match_device(
>>                ^
>>
>> vim +464 drivers/leds/leds-pca9532.c
>>
>>     448        return err;
>>     449    }
>>     450
>>     451    struct pca9532_platform_data *pca9532_of_populate_pdata(struct device *dev,
>>     452                                  struct device_node *np)
>>     453    {
>>     454        struct pca9532_platform_data *pdata;
>>     455        struct device_node *child;
>>     456        const struct of_device_id *match;
>>     457        int devid, maxleds;
>>     458        int i = 0;
>>     459
>>     460        match = of_match_device(of_pca9532_leds_match, dev);
>>     461        if (!match)
>>     462            return ERR_PTR(-ENODEV);
>>     463
>>   > 464        devid = (int)match->data;
>>     465        maxleds = pca9532_chip_info_tbl[devid].num_leds;
>>     466
>>     467        pdata = devm_kzalloc(dev, sizeof(*pdata), GFP_KERNEL);
>>     468        if (!pdata)
>>     469            return ERR_PTR(-ENOMEM);
>>     470
>>     471        for_each_child_of_node(np, child) {
>>     472            if (of_property_read_string(child, "label",
>>
>> ---
>> 0-DAY kernel test infrastructure                Open Source Technology Center
>> https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
>>
>
>


-- 
Regards
Phil Reid
