From: David Lin <dtwlin@google.com>
Subject: Re: [PATCH v2 0/3] led: ledtrig-transient: add support for hrtimer
Date: Wed, 13 Sep 2017 14:20:58 -0700
Message-ID: <CAPzFB+U_d+Jz4MFPJgpF3gbPt7hE_DhSjcz0LTF8csMgjdA5dw@mail.gmail.com>
References: <20170913175400.42744-1-dtwlin@google.com> <20170913202032.GA30844@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170913202032.GA30844@amd>
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: Jonathan Corbet <corbet@lwn.net>, rpurdie@rpsys.net, Jacek Anaszewski <jacek.anaszewski@gmail.com>, hdegoede@redhat.com, Greg KH <gregkh@linuxfoundation.org>, robh@kernel.org, Rom Lemarchand <romlem@google.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

On Wed, Sep 13, 2017 at 1:20 PM, Pavel Machek <pavel@ucw.cz> wrote:
>
> Hi!
>
> > These patch series add the LED_BRIGHTNESS_FAST flag support for
> > ledtrig-transient to use hrtimer so that platforms with high-resolution timer
> > support can have better accuracy in the trigger duration timing. The need for
> > this support is driven by the fact that Android has removed the timed_ouput [1]
> > and is now using led-trigger for handling vibrator control which requires the
> > timer to be accurate up to a millisecond. However, this flag support would also
> > allow hrtimer to co-exist with the ktimer without causing warning to the
> > existing drivers [2].
>
> NAK.
>
> LEDs do not need extra overhead, and vibrator control should not go
> through LED subsystem.
>
> Input subsystem includes support for vibrations and force
> feedback. Please use that instead.

I thought we are already over this discussion. As of now, the support
of vibrator through ledtrig is documented
(Documentation/leds/ledtrig-transient.txt) and there are users using
it.
