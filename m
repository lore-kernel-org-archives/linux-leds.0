From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [j.anaszewski-leds:for-next 8/8]
 drivers/leds/leds-as3645a.c:649:14: warning: passing argument 4 of
 'v4l2_flash_init' from incompatible pointer type
Date: Sat, 17 Jun 2017 17:54:39 +0200
Message-ID: <eb4f1210-b4d6-c616-40a0-409b4b2dfd94@gmail.com>
References: <201706172309.PTMejiOg%fengguang.wu@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wr0-f194.google.com ([209.85.128.194]:36353 "EHLO
        mail-wr0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750908AbdFQPzZ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 17 Jun 2017 11:55:25 -0400
Received: by mail-wr0-f194.google.com with SMTP id 77so9197066wrb.3
        for <linux-leds@vger.kernel.org>; Sat, 17 Jun 2017 08:55:24 -0700 (PDT)
In-Reply-To: <201706172309.PTMejiOg%fengguang.wu@intel.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: kbuild test robot <fengguang.wu@intel.com>, Sakari Ailus <sakari.ailus@iki.fi>
Cc: kbuild-all@01.org, linux-leds@vger.kernel.org

Hi all,

I mistakenly pushed this patch to the for-next branch of linux-leds.git
while pushing pull request tag. It isn't longer there.

Best regards,
Jacek Anaszewski

On 06/17/2017 05:19 PM, kbuild test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/j.anaszewski/linux-leds.git for-next
> head:   0bb4e10789943962fc8488c5e965517c713b3be3
> commit: 0bb4e10789943962fc8488c5e965517c713b3be3 [8/8] leds: as3645a: Add LED flash class driver
> config: xtensa-allmodconfig (attached as .config)
> compiler: xtensa-linux-gcc (GCC) 4.9.0
> reproduce:
>         wget https://raw.githubusercontent.com/01org/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         git checkout 0bb4e10789943962fc8488c5e965517c713b3be3
>         # save the attached .config to linux build tree
>         make.cross ARCH=xtensa 
> 
> All warnings (new ones prefixed by >>):
> 
>    drivers/leds/leds-as3645a.c: In function 'as3645a_v4l2_setup':
>>> drivers/leds/leds-as3645a.c:649:14: warning: passing argument 4 of 'v4l2_flash_init' from incompatible pointer type
>      flash->vf = v4l2_flash_init(&flash->client->dev, NULL, &flash->fled,
>                  ^
>    In file included from drivers/leds/leds-as3645a.c:32:0:
>    include/media/v4l2-flash-led-class.h:124:20: note: expected 'struct led_classdev_flash *' but argument is of type 'struct led_classdev *'
>     struct v4l2_flash *v4l2_flash_init(
>                        ^
> 
> vim +/v4l2_flash_init +649 drivers/leds/leds-as3645a.c
> 
>    633			.torch_intensity = {
>    634				.min = AS_TORCH_INTENSITY_MIN,
>    635				.max = flash->cfg.assist_max_ua,
>    636				.step = AS_TORCH_INTENSITY_STEP,
>    637				.val = flash->cfg.assist_max_ua,
>    638			},
>    639			.indicator_intensity = {
>    640				.min = AS_INDICATOR_INTENSITY_MIN,
>    641				.max = flash->cfg.indicator_max_ua,
>    642				.step = AS_INDICATOR_INTENSITY_STEP,
>    643				.val = flash->cfg.indicator_max_ua,
>    644			},
>    645		};
>    646	
>    647		strlcpy(cfg.dev_name, led->name, sizeof(cfg.dev_name));
>    648	
>  > 649		flash->vf = v4l2_flash_init(&flash->client->dev, NULL, &flash->fled,
>    650					    &flash->iled_cdev, NULL, &cfg);
>    651		if (IS_ERR(flash->vf))
>    652			return PTR_ERR(flash->vf);
>    653	
>    654		return 0;
>    655	}
>    656	
>    657	static int as3645a_probe(struct i2c_client *client)
> 
> ---
> 0-DAY kernel test infrastructure                Open Source Technology Center
> https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
> 
