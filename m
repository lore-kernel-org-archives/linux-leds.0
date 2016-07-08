From: "Rafael J. Wysocki" <rafael@kernel.org>
Subject: Re: [PATCH v9 1/1] leds: LED driver for TI LP3952 6-Channel Color LED
Date: Fri, 8 Jul 2016 21:28:06 +0200
Message-ID: <CAJZ5v0i0QV3GEXsww5AAer4zkDEW30kd9HOm0QV2xYE0xhc5qQ@mail.gmail.com>
References: <1467974244-3161-1-git-send-email-tony.makkiel@daqri.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-acpi-owner@vger.kernel.org>
In-Reply-To: <1467974244-3161-1-git-send-email-tony.makkiel@daqri.com>
Sender: linux-acpi-owner@vger.kernel.org
To: Tony Makkiel <tony.makkiel@daqri.com>, Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-leds@vger.kernel.org, ACPI Devel Maling List <linux-acpi@vger.kernel.org>, Jacek Anaszewski <j.anaszewski@samsung.com>, rpurdie@rpsys.net, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>
List-Id: linux-leds@vger.kernel.org

On Fri, Jul 8, 2016 at 12:37 PM, Tony Makkiel <tony.makkiel@daqri.com> wrote:
> The chip can drive 2 sets of RGB leds. Controller can
> be controlled via PWM, I2C and audio synchronisation.
> This driver uses I2C to communicate with the chip.
>
> Datasheet: http://www.ti.com/lit/gpn/lp3952
>
> Signed-off-by: Tony Makkiel <tony.makkiel@daqri.com>

>From the ACPI perspective, I don't see anything objectionable here.

Mika, do you agree?

Thanks,
Rafael
