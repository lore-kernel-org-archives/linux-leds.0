From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH 0/2] Intel Cherry Trail Whiskey Cove LEDs support
Date: Mon, 11 Feb 2019 13:59:51 +0200
Message-ID: <20190211115951.GC9224@smile.fi.intel.com>
References: <20190209221213.24052-1-jekhor@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190209221213.24052-1-jekhor@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yauhen Kharuzhy <jekhor@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, Lee Jones <lee.jones@linaro.org>
List-Id: linux-leds@vger.kernel.org

On Sun, Feb 10, 2019 at 01:12:12AM +0300, Yauhen Kharuzhy wrote:
> This patch series introduces new driver for controlling LEDs connected
> to Intel Cherry Trail Whiskey Cove PMIC (general-purpose LED and charger
> status led). Only simple 'always on' and blinking modes are supported
> for now, no breathing.
> 
> Driver was tested only with Lenovo Yoga Book notebook, and I don't have
> any documentation for the PMIC, so proposals and testing are welcome.
> 

I'm not sure you have a correct Cc list here. LED maintainers are
M:      Jacek Anaszewski <jacek.anaszewski@gmail.com>
M:      Pavel Machek <pavel@ucw.cz>

Also would be nice to cc to Hans de Goede.


-- 
With Best Regards,
Andy Shevchenko
