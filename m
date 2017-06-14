From: Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: [PATCH 0/8] Support registering lens, flash and EEPROM devices
Date: Wed, 14 Jun 2017 12:53:46 +0300
Message-ID: <20170614095346.GG12407@valkosipuli.retiisi.org.uk>
References: <1497433639-13101-1-git-send-email-sakari.ailus@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-media-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1497433639-13101-1-git-send-email-sakari.ailus@linux.intel.com>
Sender: linux-media-owner@vger.kernel.org
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, sebastian.reichel@collabora.co.uk, robh@kernel.org, pavel@ucw.cz
List-Id: linux-leds@vger.kernel.org

On Wed, Jun 14, 2017 at 12:47:11PM +0300, Sakari Ailus wrote:
> Hi folks,
> 
> This set adds support for async registering of lens, flash and EEPROM
> devices, as well as support for this in the smiapp driver and a LED driver
> for the as3645a.
> 
> The lens and flash devices are entities in the media graph whereas the
> EEPROM is at least currently not. By providing the association information
> it is possible to add the flash device to the media graph.

I forgot to add that this set depends on another set Niklas recently posted:

<URL:http://www.spinics.net/lists/linux-media/msg116906.html>

-- 
Sakari Ailus
e-mail: sakari.ailus@iki.fi	XMPP: sailus@retiisi.org.uk
