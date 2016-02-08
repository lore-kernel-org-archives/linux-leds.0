From: Lukas Wunner <lukas@wunner.de>
Subject: Re: [PATCH v2 00/16] Common Dell SMBIOS API
Date: Mon, 8 Feb 2016 20:30:07 +0100
Message-ID: <20160208193007.GA14985@wunner.de>
References: <1453472848-3118-1-git-send-email-kernel@kempniu.pl>
 <20160122144851.GN7192@pali>
 <20160208192014.GN1779@malice.jf.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160208192014.GN1779@malice.jf.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>
Cc: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>, Micha?? K??pie?? <kernel@kempniu.pl>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Matthew Garrett <mjg59@srcf.ucam.org>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Hi,

On Mon, Feb 08, 2016 at 11:20:14AM -0800, Darren Hart wrote:
> My only major concern is module load order dependencies. Inter-module
> dependencies are frowned upon with good reason, the kernel load ordering is
> non-deterministic and it's possible, for example, for dell-laptop to fail to
> find the symbols exported by dell-smbios under certain conditions.
> 
> I have worked around this in the past with things like the following:
> 
> #ifdef MODULE
> #ifdef CONFIG_FOO_MODULE
> 	if (request_module("foo"))
> 		return -ENODEV;
> #endif
> #endif
> 
> Something like the above may be necessary for dell-smbios in dell-laptop,
> dell-wmi, and dell-leds now that they depend on the dell-smbios exported
> functions.
> 
> Cc Greg in case there is a better way to handle this that I'm not aware of.

Deferred probing seems to be the preferred way, see e.g.:
https://lists.freedesktop.org/archives/dri-devel/2016-January/098404.html

(In this example, apple_gmux_present() determines presence of the device
and !vga_switcheroo_handler_flags() determine non-presence of its driver.)

This will also work if the subsystem depended on is compiled in rather
than in a module.

Best regards,

Lukas
