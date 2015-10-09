From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH 1/5] leds: core: Drivers shouldn't enforce SYNC/ASYNC
 brightness setting
Date: Fri, 09 Oct 2015 08:28:44 +0200
Message-ID: <56175E9C.5040403@samsung.com>
References: <1442845770-17800-1-git-send-email-j.anaszewski@samsung.com>
 <1442845770-17800-2-git-send-email-j.anaszewski@samsung.com>
 <20151008155036.GF11776@xo-6d-61-c0.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:26883 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753994AbbJIG2s (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Fri, 9 Oct 2015 02:28:48 -0400
In-reply-to: <20151008155036.GF11776@xo-6d-61-c0.localdomain>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, andrew@lunn.ch, sakari.ailus@linux.intel.com

On 10/08/2015 05:50 PM, Pavel Machek wrote:
> On Mon 2015-09-21 16:29:26, Jacek Anaszewski wrote:
>> This patch removes SET_BRIGHTNESS_ASYNC and SET_BRIGHTNESS flags.

s/SET_BRIGHTNESS/SET_BRIGHTNESS_SYNC/

>> led_set_brightness now calls led_set_brightness_nosleep instead of
>> choosing between sync and async op basing on the flags defined by the
>> driver.
>
> Are those flags unused in the version of kernel you are patching?

The flags are used until this patch.

> If so, tell us so in the changelog. Thanks,


-- 
Best Regards,
Jacek Anaszewski
