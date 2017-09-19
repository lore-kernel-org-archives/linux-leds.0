From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: "Say Y" on CONFIG_LEDS_TRIGGER_ACTIVITY
Date: Tue, 19 Sep 2017 22:05:11 +0200
Message-ID: <e621b590-422d-bab5-72da-da21da8f9fd6@gmail.com>
References: <20170919195002.GA21940@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f53.google.com ([74.125.82.53]:46730 "EHLO
        mail-wm0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751361AbdISUGF (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 19 Sep 2017 16:06:05 -0400
In-Reply-To: <20170919195002.GA21940@amd>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Pavel,

On 09/19/2017 09:50 PM, Pavel Machek wrote:
> Hi!
> 
> Help text says:
> 
> CONFIG_LEDS_TRIGGER_ACTIVITY:
> 
> This allows LEDs to be controlled by a immediate CPU usage.
> The flash frequency and duty cycle varies from faint flashes to
> intense brightness depending on the instant CPU load.
> If unsure, say Y.
> 
> I don't believe this is important enough trigger that we should
> suggest it by default. So I believe this should be changed to "say N".

Thanks for the heads-up.
Fixed the related commit on the for-next branch of linux-leds.git.

-- 
Best regards,
Jacek Anaszewski
