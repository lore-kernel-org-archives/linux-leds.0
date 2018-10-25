From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v2 2/3] leds: upboard: Add LED support
Date: Thu, 25 Oct 2018 12:22:21 +0300
Message-ID: <20181025092221.GW10650@smile.fi.intel.com>
References: <20180421085009.28773-1-javier@emutex.com>
 <1539969334-24577-1-git-send-email-dan@emutex.com>
 <1539969334-24577-3-git-send-email-dan@emutex.com>
 <ede59ef8-7caf-413d-6858-33a1eab5f084@gmail.com>
 <20181023185453.GA27397@amd>
 <226e0df2-83f9-bee5-f359-a3e040d12311@gmail.com>
 <20181023193014.GA32003@amd>
 <00720f10-a525-32d1-0aa5-00fc88251f5e@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <00720f10-a525-32d1-0aa5-00fc88251f5e@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Pavel Machek <pavel@ucw.cz>, Dan O'Donovan <dan@emutex.com>, linux-kernel@vger.kernel.org, Mika Westerberg <mika.westerberg@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-leds@vger.kernel.org, Carlos Iglesias <carlos.iglesias@emutex.com>, Javier Arteaga <javier@emutex.com>
List-Id: linux-leds@vger.kernel.org

On Wed, Oct 24, 2018 at 10:07:30PM +0200, Jacek Anaszewski wrote:

> Yet, there are many out of LED subsystem files to update:
> 
> find -name "*.c" -o -name "*.h" | xargs grep  "enum led_brightness" |
> awk -F: '{print $1}' | sort -u | grep -v "leds" | wc -l
> 
> returns 87.

Side note: 

git grep -n 'enum led_brightness' | ...

a bit more effitient.

-- 
With Best Regards,
Andy Shevchenko
