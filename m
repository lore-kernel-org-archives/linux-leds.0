From: "Kim, Milo" <milo.kim@ti.com>
Subject: Re: [PATCH] leds: lp5523: add master_fader support
Date: Tue, 12 May 2015 17:25:29 +0900
Message-ID: <5551B8F9.6040808@ti.com>
References: <1431371454-2035-1-git-send-email-toshik@chromium.org> <5551AAFA.5080807@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from bear.ext.ti.com ([192.94.94.41]:40578 "EHLO bear.ext.ti.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752681AbbELIZi (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Tue, 12 May 2015 04:25:38 -0400
In-Reply-To: <5551AAFA.5080807@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>, Toshi Kikuchi <toshik@chromium.org>
Cc: linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, Bryan Wu <cooloney@gmail.com>

Hi Jacek and Toshi,

On 5/12/2015 4:25 PM, Jacek Anaszewski wrote:
> Hi Toshi,
>
> On 05/11/2015 09:10 PM, Toshi Kikuchi wrote:
>> This patch introduces 4 new attributes:
>>     master_fader_leds
>>     master_fader1
>>     master_fader2
>>     master_fader3
>>
>> Fo example, to map channel 0,6 to master_fader1,
>> map channel 1,7 to master_fader2,
>> map channel 2,8 to master_fader3, and
>> map channel 3,4,5 to none
>   >
>>     echo "123000123" > master_fader_leds
>
> I propose to add ABI documentation for this driver. It already exposes
> many custom attributes but I can't find documentation for them.

I agree with Jacek's comment but it would be better if we could see the 
description in lp5523 driver 
documentation(Documentation/leds/leds-lp5523.txt).

Best regards,
Milo
