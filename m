From: Jiri Kosina <jikos@kernel.org>
Subject: Re: [PATCH] hid: thingm: reorder calls in thingm_probe
Date: Thu, 10 Mar 2016 10:37:47 +0100 (CET)
Message-ID: <alpine.LNX.2.00.1603101036440.3656@cbobk.fhfr.pm>
References: <56D5FA62.5000203@gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-input-owner@vger.kernel.org>
In-Reply-To: <56D5FA62.5000203@gmail.com>
Sender: linux-input-owner@vger.kernel.org
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>, Jacek Anaszewski <j.anaszewski@samsung.com>, linux-input@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

On Tue, 1 Mar 2016, Heiner Kallweit wrote:

> Based on a suggestion from Benjamin move hid_hw_start() after
> thingm_version() to avoid potential races.

Please make the changelog much more verbose. Namely please describe the 
exact problems this patch is fixing (IOW why we'd want this patch in the 
first place).

Thanks,

-- 
Jiri Kosina
SUSE Labs

