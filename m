From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Subject: Re: [PATCH v6] platform/chrome: Add Wilco EC keyboard backlight LEDs
 support
Date: Mon, 3 Jun 2019 18:35:59 +0200
Message-ID: <66bafd50-1599-db70-99da-e7f5877281c2@collabora.com>
References: <20190409001642.249197-1-ncrews@chromium.org>
 <20190409095503.GB32344@atrey.karlin.mff.cuni.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190409095503.GB32344@atrey.karlin.mff.cuni.cz>
Content-Language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>, Nick Crews <ncrews@chromium.org>
Cc: bleung@chromium.org, linux-leds@vger.kernel.org, jacek.anaszewski@gmail.com, linux-kernel@vger.kernel.org, dlaurie@chromium.org, sjg@google.com, groeck@google.com, dtor@google.com
List-Id: linux-leds@vger.kernel.org

Hi Pavel,

On 9/4/19 11:55, Pavel Machek wrote:
>> The EC is in charge of controlling the keyboard backlight on
>> the Wilco platform. We expose a standard LED class device at
>> /sys/class/leds/chromeos::kbd_backlight. This driver is modeled
> 
> As discussed, please use platform::.
> 

Last time I looked at this patch there were some work and discussion ongoing
about led naming in led ML, did the discussion end? I'm not able to find if
there is a final agreement.

Thanks,
 Enric

> 								Pavel
> 
