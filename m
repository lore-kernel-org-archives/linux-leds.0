From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v4 2/5] leds: Add helper for getting default pattern from
 Device Tree
Date: Thu, 27 Dec 2018 09:47:23 +0100
Message-ID: <CAJKOXPew1Ufq8vOE2=dqh-=zCQpB8H-X+CEK456MqgcEsNi+5A@mail.gmail.com>
References: <1545146852-32207-1-git-send-email-krzk@kernel.org> <1545146852-32207-3-git-send-email-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1545146852-32207-3-git-send-email-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Raphael Teysseyre <rteysseyre@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, Baolin Wang <baolin.wang@linaro.org>, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, devicetree@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

On Tue, 18 Dec 2018 at 16:27, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> Multiple LED triggers might need to access default pattern so add a
> helper for that.
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  drivers/leds/led-class.c | 42 ++++++++++++++++++++++++++++++++++++++++++

As pointed out by 0day-ci this has to be in leds-core.c.

I'll fix it.

Best regards,
Krzysztof
