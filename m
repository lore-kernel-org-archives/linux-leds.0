From: Alan Mizrahi <alan@mizrahi.com.ve>
Subject: Re: [PATCH v4 1/1] leds: Add driver for PC Engines APU/APU2 LEDs
Date: Sat, 4 Nov 2017 10:21:28 +0900
Message-ID: <545b36bf-9577-c2bf-4896-1d19b50f9f9e@mizrahi.com.ve>
References: <20171103013807.GA13284@poseidon>
 <4ec288c4-2d03-fb2a-04ae-9c901c74219f@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail01.asahi-net.or.jp ([202.224.55.13]:51513 "EHLO
        mail01.asahi-net.or.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751805AbdKDBY0 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 3 Nov 2017 21:24:26 -0400
In-Reply-To: <4ec288c4-2d03-fb2a-04ae-9c901c74219f@gmail.com>
Content-Language: en-US
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Pavel Machek <pavel@ucw.cz>
Cc: linux-leds@vger.kernel.org

On 2017-11-04 04:48, Jacek Anaszewski wrote:
> Hi Alan,
> 
> Thanks for addressing my remarks.
> You omitted one detail, though. Please refer below.
> 
> On 11/03/2017 02:38 AM, Alan Mizrahi wrote:

>> +static const struct dmi_system_id apu_led_dmi_table[] __initdata = {

> 
> s/__initdata/__initconst/
> 
> I can fix it up by myself, if you agree.

I missed that one.
I'm fine either way, I can also submit another patch if you prefer.

Best regards,

Alan Mizrahi
