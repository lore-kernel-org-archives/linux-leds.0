From: Joe Perches <joe@perches.com>
Subject: Re: [PATCH v2 2/3] leds: upboard: Add LED support
Date: Wed, 24 Oct 2018 03:24:44 -0700
Message-ID: <f9b3b4377768249febf62bb5d5c5f5b6197f627f.camel@perches.com>
References: <20180421085009.28773-1-javier@emutex.com>
         <1539969334-24577-1-git-send-email-dan@emutex.com>
         <1539969334-24577-3-git-send-email-dan@emutex.com>
         <ede59ef8-7caf-413d-6858-33a1eab5f084@gmail.com>
         <16591e6735e32baad10f083c688119ce79d12911.camel@perches.com>
         <20181024101340.GR10650@smile.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181024101340.GR10650@smile.fi.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Dan O'Donovan <dan@emutex.com>, linux-kernel@vger.kernel.org, Mika Westerberg <mika.westerberg@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Pavel Machek <pavel@ucw.cz>, linux-gpio@vger.kernel.org, linux-leds@vger.kernel.org, Carlos Iglesias <carlos.iglesias@emutex.com>, Javier Arteaga <javier@emutex.com>
List-Id: linux-leds@vger.kernel.org

On Wed, 2018-10-24 at 13:13 +0300, Andy Shevchenko wrote:
> On Tue, Oct 23, 2018 at 12:23:13PM -0700, Joe Perches wrote:
> > Until such a time when either a local preferred style
> > document or a treewide preferred style exists, please
> > stop asking people to modify #include ordering for
> > various styles like reverse christmas tree by length,
> > alphabetic ordering, or other individual styles.
> 
> Why? It makes a sense to ask for new code (and even for patches against old one in some cases).

It's just a nit and frequently impossible to require as
ordering dependencies between include files do exist.

> > My preferred style would always have kernel.h first
> > as that may help with precompiled headers and overall
> > kernel compilation time one day.
> 
> How ordering would screw this up?

gcc has many limits on the use of precompiled headers.

https://gcc.gnu.org/onlinedocs/gcc/Precompiled-Headers.html

Precompiled headers are often shared by multiple
compilation units and precompilation can be stopped
after a specific header.
