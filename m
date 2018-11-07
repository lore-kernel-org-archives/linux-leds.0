From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH trivial] Documentation: ABI: led-trigger-pattern: Fix
 typos
Date: Wed, 7 Nov 2018 21:45:35 +0100
Message-ID: <58507e6b-a1a9-c1ff-e469-11611ba7e8ab@gmail.com>
References: <20181107134524.13989-1-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181107134524.13989-1-geert+renesas@glider.be>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>, Baolin Wang <baolin.wang@linaro.org>, Jiri Kosina <trivial@kernel.org>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Hi Geert,

On 11/07/2018 02:45 PM, Geert Uytterhoeven wrote:
>   - Spelling s/brigntess/brightness/,
>   - Double "use".
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  Documentation/ABI/testing/sysfs-class-led-trigger-pattern | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-class-led-trigger-pattern b/Documentation/ABI/testing/sysfs-class-led-trigger-pattern
> index fb3d1e03b8819bb9..1e5d172e064624d9 100644
> --- a/Documentation/ABI/testing/sysfs-class-led-trigger-pattern
> +++ b/Documentation/ABI/testing/sysfs-class-led-trigger-pattern
> @@ -37,8 +37,8 @@ Description:
>  		  0-|   /             \/             \/
>  		    +---0----1----2----3----4----5----6------------> time (s)
>  
> -		2. To make the LED go instantly from one brigntess value to another,
> -		we should use use zero-time lengths (the brightness must be same as
> +		2. To make the LED go instantly from one brightness value to another,
> +		we should use zero-time lengths (the brightness must be same as
>  		the previous tuple's). So the format should be:
>  		"brightness_1 duration_1 brightness_1 0 brightness_2 duration_2
>  		brightness_2 0 ...". For example:
> 

Thanks for the patch.

Applied to the fixes-for-4.20-rc2 branch of linux-leds.git.

-- 
Best regards,
Jacek Anaszewski
