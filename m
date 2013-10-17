From: =?ISO-8859-1?Q?Maximilian_G=FCntner?=
	<maximilian.guentner@gmail.com>
Subject: Re: [PATCH v3] leds: Added driver for the NXP PCA9685 I2C chip
Date: Fri, 18 Oct 2013 01:00:06 +0200
Message-ID: <CAKSnaaf05mA_TKVpH6iESdRU_4cxNwBs-qW_Prmfrfj+KyK6HQ@mail.gmail.com>
References: <525d89e8.CwG1bICTvwrMEEOp%fengguang.wu@intel.com>
	<CAK5ve-K41dCLhQnbicqobU889WKe2dGUCJ4Tqy4f_w-F4p27eQ@mail.gmail.com>
	<CAK5ve-+tr5GWg7JSOVF3BB17f+i2Eg57dtm4+Gp9ZzRE+L0Vuw@mail.gmail.com>
	<1381972157-14563-1-git-send-email-maximilian.guentner@gmail.com>
	<CAK5ve-Ljxqw2QGG2hS+x7J99_HJgezo94YxOkhvGiPh_1qZ-_A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-ve0-f180.google.com ([209.85.128.180]:42869 "EHLO
	mail-ve0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751045Ab3JQXAI convert rfc822-to-8bit (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 17 Oct 2013 19:00:08 -0400
In-Reply-To: <CAK5ve-Ljxqw2QGG2hS+x7J99_HJgezo94YxOkhvGiPh_1qZ-_A@mail.gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Bryan Wu <cooloney@gmail.com>
Cc: Jingoo Han <jg1.han@samsung.com>, Richard Purdie <rpurdie@rpsys.net>, lkml <linux-kernel@vger.kernel.org>, Linux LED Subsystem <linux-leds@vger.kernel.org>, Peter Meerwald <pmeerw@pmeerw.net>, kbuild-all@01.org

Hello Bryan,

thank you for applying the patch so quickly.

Maximilian

2013/10/18 Bryan Wu <cooloney@gmail.com>:
> On Wed, Oct 16, 2013 at 6:09 PM, Maximilian G=FCntner
> <maximilian.guentner@gmail.com> wrote:
>> The NXP PCA9685 supports 16 channels/leds using a 12-bit PWM (4095
>> levels of brightness)
>> This driver supports configuration using platform_data.
>>
>> Signed-off-by: Maximilian G=FCntner <maximilian.guentner@gmail.com>
>> ---
>>  v3:
>>    fixed warnings when running make C=3D1 CF=3D-D__CHECK_ENDIAN__:
>>     * replaced u16* by __le16*
>>
>
> OK, replaced the old one in my tree.
>
> Thanks,
> -Bryan
>
--
To unsubscribe from this list: send the line "unsubscribe linux-leds" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
