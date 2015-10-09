From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH 1/5] leds: core: Drivers shouldn't enforce SYNC/ASYNC
 brightness setting
Date: Fri, 09 Oct 2015 10:08:12 +0200
Message-ID: <561775EC.80703@samsung.com>
References: <1442845770-17800-1-git-send-email-j.anaszewski@samsung.com>
 <1442845770-17800-2-git-send-email-j.anaszewski@samsung.com>
 <20151008155036.GF11776@xo-6d-61-c0.localdomain>
 <56175E9C.5040403@samsung.com> <20151009070202.GA27183@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:33661 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756015AbbJIIIP (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Fri, 9 Oct 2015 04:08:15 -0400
In-reply-to: <20151009070202.GA27183@amd>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, andrew@lunn.ch, sakari.ailus@linux.intel.com

On 10/09/2015 09:02 AM, Pavel Machek wrote:
> On Fri 2015-10-09 08:28:44, Jacek Anaszewski wrote:
>> On 10/08/2015 05:50 PM, Pavel Machek wrote:
>>> On Mon 2015-09-21 16:29:26, Jacek Anaszewski wrote:
>>>> This patch removes SET_BRIGHTNESS_ASYNC and SET_BRIGHTNESS flags.
>>
>> s/SET_BRIGHTNESS/SET_BRIGHTNESS_SYNC/
>>
>>>> led_set_brightness now calls led_set_brightness_nosleep instead of
>>>> choosing between sync and async op basing on the flags defined by the
>>>> driver.
>>>
>>> Are those flags unused in the version of kernel you are patching?
>>
>> The flags are used until this patch.
>
> Hmm. I seen you removing the definitions, but not removing any
> users. I guess I missed something.

Only LED core is the user. It sets SET_BRIGHTNESS_SYNC flag
for LED flash class drivers.

-- 
Best Regards,
Jacek Anaszewski
