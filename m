From: Bryan Wu <cooloney@gmail.com>
Subject: Re: [PATCH 1/2] leds: 88pm860x: Use of_get_child_by_name
Date: Fri, 18 Apr 2014 18:02:58 -0700
Message-ID: <CAK5ve-JfGY0CbRXAuHYgp6i=VJObLKtbMcjaHgzFgpwJRdsCMA@mail.gmail.com>
References: <1396597880-2325-1-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1396597880-2325-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Richard Purdie <rpurdie@rpsys.net>, Linux LED Subsystem <linux-leds@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org

On Fri, Apr 4, 2014 at 12:51 AM, Krzysztof Kozlowski
<k.kozlowski@samsung.com> wrote:
> Use of_get_child_by_name to obtain reference to charger node instead of
> of_find_node_by_name which can walk outside of the parent node.
>

Looks good to me, applied to my for-next branch.
Thanks,
-Bryan


> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> ---
>  drivers/leds/leds-88pm860x.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/leds/leds-88pm860x.c b/drivers/leds/leds-88pm860x.c
> index 5f588c0a376e..2f9ee538f30d 100644
> --- a/drivers/leds/leds-88pm860x.c
> +++ b/drivers/leds/leds-88pm860x.c
> @@ -134,7 +134,7 @@ static int pm860x_led_dt_init(struct platform_device *pdev,
>         nproot = of_node_get(pdev->dev.parent->of_node);
>         if (!nproot)
>                 return -ENODEV;
> -       nproot = of_find_node_by_name(nproot, "leds");
> +       nproot = of_get_child_by_name(nproot, "leds");
>         if (!nproot) {
>                 dev_err(&pdev->dev, "failed to find leds node\n");
>                 return -ENODEV;
> --
> 1.7.9.5
>
