From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 4/5] dt-bindings: leds: Add pattern initialization from
 Device Tree
Date: Tue, 11 Dec 2018 11:23:29 -0600
Message-ID: <CABGGiszi3cgkQy0+h4q6nEY0V1Td2x3eR_kZ50cu3awrSGscMQ@mail.gmail.com>
References: <1544434201-14190-1-git-send-email-krzk@kernel.org> <1544434201-14190-5-git-send-email-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1544434201-14190-5-git-send-email-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: krzk@kernel.org
Cc: jacek.anaszewski@gmail.com, pavel@ucw.cz, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Baolin Wang <baolin.wang@linaro.org>, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org

On Mon, Dec 10, 2018 at 3:30 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> Document new linux,trigger-pattern property for initialization of LED
> pattern trigger.
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  Documentation/devicetree/bindings/leds/common.txt | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/leds/common.txt b/Documentation/devicetree/bindings/leds/common.txt
> index aa1399814a2a..4c65e854bb91 100644
> --- a/Documentation/devicetree/bindings/leds/common.txt
> +++ b/Documentation/devicetree/bindings/leds/common.txt
> @@ -37,6 +37,13 @@ Optional properties for child nodes:
>       "ide-disk" - LED indicates IDE disk activity (deprecated),
>                    in new implementations use "disk-activity"
>       "timer" - LED flashes at a fixed, configurable rate
> +     "pattern" - LED alters the brightness for the specified duration with one
> +                 software timer (see
> +                 Documentation/ABI/testing/sysfs-class-led-trigger-pattern)
> +
> +- linux,trigger-pattern : Default pattern for "pattern" trigger (see
> +                          Documentation/ABI/testing/sysfs-class-led-trigger-pattern
> +                          for description of format)

Binding documents should generally not refer to kernel docs and need
to stand on their own.

I don't think this needs to be linux specific. I'd just call it
'led-pattern'. I don't think this should be tied to the trigger types.
Isn't possible you would want to tie a pattern to different triggers.
IOW, when event X happens, run the pattern. And you could have
one-shot versus continuous.

Rob
