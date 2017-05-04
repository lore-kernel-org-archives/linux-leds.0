From: David Lin <dtwlin@google.com>
Subject: Re: [PATCH 0/3] led: ledtrig-transient: add support for hrtimer
Date: Wed, 3 May 2017 17:28:46 -0700
Message-ID: <CAPzFB+U25eX9H9DTxxPj9FH4r3OrmS8mWgK2Ye-OdAXkf=4p7Q@mail.gmail.com>
References: <20170430213701.12297-1-dtwlin@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170430213701.12297-1-dtwlin@google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan Corbet <corbet@lwn.net>, rpurdie@rpsys.net, Jacek Anaszewski <jacek.anaszewski@gmail.com>, pavel@ucw.cz, hdegoede@redhat.com, mark.rutland@arm.com, Tony Makkiel <tony.makkiel@daqri.com>, Stephan Linz <linz@li-pro.net>
Cc: robh@kernel.org, Rom Lemarchand <romlem@google.com>, Joel Fernandes <joelaf@google.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, David Lin <dtwlin@google.com>, Greg KH <gregkh@linuxfoundation.org>
List-Id: linux-leds@vger.kernel.org

+Cc: Greg KH

On Sun, Apr 30, 2017 at 2:36 PM, David Lin <dtwlin@google.com> wrote:
> Hi,
>
> These patch series add the LED_BRIGHTNESS_FAST flag support for
> ledtrig-transient to use hrtimer so that platforms with high-resolution timer
> support can have better accuracy in the trigger duration timing. The need for
> this support is driven by the fact that Android has removed the timed_ouput [1]
> and is now using led-trigger for handling vibrator control which requires the
> timer to be accurate up to a millisecond. However, this flag support would also
> allow hrtimer to co-exist with the ktimer without causing warning to the
> existing drivers [2].
>
> David
>
> [1] https://patchwork.kernel.org/patch/8664831/
> [2] https://lkml.org/lkml/2015/4/28/260
>
> David Lin (3):
>   leds: Replace flags bit shift with BIT() macros
>   leds: Add the LED_BRIGHTNESS_FAST flag
>   led: ledtrig-transient: add support for hrtimer
>
>  Documentation/leds/leds-class.txt        |  5 +++
>  drivers/leds/trigger/ledtrig-transient.c | 59 +++++++++++++++++++++++++++++---
>  include/linux/leds.h                     | 13 +++----
>  3 files changed, 66 insertions(+), 11 deletions(-)
>
> --
> 2.13.0.rc0.306.g87b477812d-goog
>
