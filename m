From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH 4/9] devicectree: bindings: fix location of leds common
 file
Date: Tue, 26 Jun 2018 21:41:03 +0200
Message-ID: <a47c6716-ef88-464b-bc9c-236ff90b88b1@gmail.com>
References: <cover.1530005114.git.mchehab+samsung@kernel.org>
 <51f7b37fd560a2cf8a79db5222bf02abef97510b.1530005114.git.mchehab+samsung@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <51f7b37fd560a2cf8a79db5222bf02abef97510b.1530005114.git.mchehab+samsung@kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@infradead.org>, linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-leds@vger.kernel.org, devicetree@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Hi Mauro.

Thank you for the patch.

On 06/26/2018 11:49 AM, Mauro Carvalho Chehab wrote:
> The leds.txt was moved and renamed. Fix references to
> it accordingly.
> 
> Fixes: f67605394f0b ("devicetree/bindings: Move gpio-leds binding into leds directory")
> Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
> ---
>   Documentation/devicetree/bindings/leds/common.txt | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/leds/common.txt b/Documentation/devicetree/bindings/leds/common.txt
> index 1d4afe9644b6..aa1399814a2a 100644
> --- a/Documentation/devicetree/bindings/leds/common.txt
> +++ b/Documentation/devicetree/bindings/leds/common.txt
> @@ -31,7 +31,7 @@ Optional properties for child nodes:
>        "backlight" - LED will act as a back-light, controlled by the framebuffer
>   		   system
>        "default-on" - LED will turn on (but for leds-gpio see "default-state"
> -		    property in Documentation/devicetree/bindings/gpio/led.txt)
> +		    property in Documentation/devicetree/bindings/leds/leds-gpio.txt)
>        "heartbeat" - LED "double" flashes at a load average based rate
>        "disk-activity" - LED indicates disk activity
>        "ide-disk" - LED indicates IDE disk activity (deprecated),
> 

Applied.

-- 
Best regards,
Jacek Anaszewski
