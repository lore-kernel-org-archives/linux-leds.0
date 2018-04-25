From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [RFC PATCH RESEND 0/3] UP Squared board drivers
Date: Wed, 25 Apr 2018 12:53:55 +0300
Message-ID: <20180425095355.GM2173@lahna.fi.intel.com>
References: <20180421085009.28773-1-javier@emutex.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180421085009.28773-1-javier@emutex.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Javier Arteaga <javier@emutex.com>
Cc: linux-kernel@vger.kernel.org, Dan O'Donovan <dan@emutex.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, linux-gpio@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

On Sat, Apr 21, 2018 at 09:50:06AM +0100, Javier Arteaga wrote:
> [linux-kernel correctly Cc'd on the series now. Sorry for the noise.]
> 
> Hi all,
> 
> This series adds platform support for AAEON's UP Squared, a x86 SBC
> based on Apollo Lake [1]. Specifically, it enables control for the board
> pin headers and for the LEDs, as both of these features are only
> available behind a FPGA-based platform controller.
> 
> This is structured around a MFD driver that provides a regmap interface
> to that platform controller to each MFD cell.
> 
> The series is carved out from an out-of-tree support patchset, initially
> written by Dan O'Donovan for the original UP Board [2] and then extended
> through the past year to support new entries in the lineup (UP Board, UP
> Squared and UP Core) [3].
> 
> Here we only submit support for UP Squared to simplify review. Still,
> the driver is designed so that it can easily gain support for the other
> boards.
> 
> Questions:
> 
> * Is MFD the right fit for the platform controller?
>   The intention here is to encapsulate the custom GPIO-bitbanged control
>   protocol by sharing the regmap between the drivers.
> 
> * Is our use of two chained pinctrls (in patch 3/3) valid?

There are few minor comments but other than that, to me this looks like
a reasonable approach.
