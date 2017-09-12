From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: Splitting led drivers to subdirectories?
Date: Tue, 12 Sep 2017 21:11:07 +0200
Message-ID: <72bc03c4-90d8-0f82-42b5-172022fb6a8b@gmail.com>
References: <20170912125408.GA4074@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f49.google.com ([74.125.82.49]:46585 "EHLO
        mail-wm0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750869AbdILTMB (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 12 Sep 2017 15:12:01 -0400
In-Reply-To: <20170912125408.GA4074@amd>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org, kernel list <linux-kernel@vger.kernel.org>

Hi,

On 09/12/2017 02:54 PM, Pavel Machek wrote:
> Hi!
> 
> Is it time to start splitting drivers into subdirectories?
> 
> I'd quite like to see drivers/leds/i2c/ and drivers/leds/flash/ . That
> way it is easier to look at related drivers for inspiration...

These categorization would be inconsistent - i2c is a bus, and
flash is a LED function. Moreover, not all devices are driven through
buses, some of them via gpio, MMIO or even as2cwire like in case of
leds-aat1290. Do we want to split the drivers like that? It would
generate only unnecessary noise IMHO.

We could go for splitting drivers to LED and LED flash class,
but the former is just a subset of the latter, so it would be
also not accurate.

Effectively I propose to apply the "leave well alone" rule here :-)

-- 
Best regards,
Jacek Anaszewski
