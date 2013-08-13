From: Bryan Wu <cooloney@gmail.com>
Subject: Re: [PATCH 1/1] Documentation: leds: Fix a typo
Date: Tue, 13 Aug 2013 14:07:19 -0700
Message-ID: <CAK5ve-JTvx1MHreN8opG7CgD1mi6WPJ51nG-0Hv7Jrq4r-Mipg@mail.gmail.com>
References: <1375938479-5021-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1375938479-5021-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-doc-owner@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>
Cc: "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, Linux LED Subsystem <linux-leds@vger.kernel.org>, Rob Landley <rob@landley.net>
List-Id: linux-leds@vger.kernel.org

On Wed, Aug 7, 2013 at 10:07 PM, Sachin Kamat <sachin.kamat@linaro.org> wrote:
> __initdata should be placed between the variable name and equal
> sign for the variable to be placed in the intended section.
> Fix the example.
>

Thanks, merged it.
-Bryan

> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> ---
>  Documentation/leds/leds-lm3556.txt |    2 +-
>  Documentation/leds/leds-lp3944.txt |    2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/leds/leds-lm3556.txt b/Documentation/leds/leds-lm3556.txt
> index d9eb91b..62278e8 100644
> --- a/Documentation/leds/leds-lm3556.txt
> +++ b/Documentation/leds/leds-lm3556.txt
> @@ -71,7 +71,7 @@ To register the chip at address 0x63 on specific adapter, set the platform data
>  according to include/linux/platform_data/leds-lm3556.h, set the i2c board info
>
>  Example:
> -       static struct i2c_board_info __initdata board_i2c_ch4[] = {
> +       static struct i2c_board_info board_i2c_ch4[] __initdata = {
>                 {
>                          I2C_BOARD_INFO(LM3556_NAME, 0x63),
>                          .platform_data = &lm3556_pdata,
> diff --git a/Documentation/leds/leds-lp3944.txt b/Documentation/leds/leds-lp3944.txt
> index c6eda18..e88ac3b 100644
> --- a/Documentation/leds/leds-lp3944.txt
> +++ b/Documentation/leds/leds-lp3944.txt
> @@ -37,7 +37,7 @@ registered using the i2c_board_info mechanism.
>  To register the chip at address 0x60 on adapter 0, set the platform data
>  according to include/linux/leds-lp3944.h, set the i2c board info:
>
> -       static struct i2c_board_info __initdata a910_i2c_board_info[] = {
> +       static struct i2c_board_info a910_i2c_board_info[] __initdata = {
>                 {
>                         I2C_BOARD_INFO("lp3944", 0x60),
>                         .platform_data = &a910_lp3944_leds,
> --
> 1.7.9.5
>
