From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH] leds: pca955x: check for I2C errors
Date: Thu, 31 Aug 2017 22:23:39 +0200
Message-ID: <4baeabee-870a-feb9-00b6-1b827971b586@gmail.com>
References: <20170830112551.3493-1-clg@kaod.org>
 <f171c638-4190-30ba-94dc-36fdf9ed10de@gmail.com>
 <1504137842.5933.24.camel@aj.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:34897 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751775AbdHaUY0 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 31 Aug 2017 16:24:26 -0400
Received: by mail-wm0-f65.google.com with SMTP id e204so671345wma.2
        for <linux-leds@vger.kernel.org>; Thu, 31 Aug 2017 13:24:25 -0700 (PDT)
In-Reply-To: <1504137842.5933.24.camel@aj.id.au>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Andrew Jeffery <andrew@aj.id.au>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, linux-leds@vger.kernel.org
Cc: Richard Purdie <rpurdie@rpsys.net>, Pavel Machek <pavel@ucw.cz>

On 08/31/2017 02:04 AM, Andrew Jeffery wrote:
> On Wed, 2017-08-30 at 22:00 +0200, Jacek Anaszewski wrote:
>> Hi Cedric,
>>
>> Thanks for the patch.
>>
>> On 08/30/2017 01:25 PM, Cédric Le Goater wrote:
>>> This should also allow probing to fail when a pca955x chip is not
>>> found on a I2C bus.
>>>
>>>>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>>> ---
>>>
>>>  Andrew,
>>>
>>>  The patch conflicts with your patch :
>>>
>>>    "leds: pca955x: Don't invert requested value in pca955x_gpio_set_value()"
>>>
>>>  and I have chosen to be in sync with the 'for-next' branch of the
>>>  linux-leds git repo. Depending on the reviews we will have to respin
>>>  one or the other.
>>
>> Applied yours as first.
>>
> 
> No worries, I'll resend.

Thanks. I'll target it for 4.15 anyway (or late 4.14 fix) to give time
for the clients to test it and complain if it would cause some serious
but non-obvious problems.

-- 
Best regards,
Jacek Anaszewski
