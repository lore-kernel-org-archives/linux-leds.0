From: walter harms <wharms@bfs.de>
Subject: Re: [PATCH][next] leds: lm36274: remove redundant initialization
 of variable ret
Date: Wed, 12 Jun 2019 17:18:40 +0200
Message-ID: <5D0117D0.501@bfs.de>
References: <20190612145659.26514-1-colin.king@canonical.com>
Reply-To: wharms@bfs.de
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190612145659.26514-1-colin.king@canonical.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Colin King <colin.king@canonical.com>
Cc: Dan Murphy <dmurphy@ti.com>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
List-Id: linux-leds@vger.kernel.org



Am 12.06.2019 16:56, schrieb Colin King:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The variable ret is being initialized with a value that is never
> read, hence it is redundant and can be removed.  Also move the
> declaration of ret to the for loop scope.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/leds/leds-lm36274.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/leds/leds-lm36274.c b/drivers/leds/leds-lm36274.c
> index ed9dc857ec8f..b55bd238c074 100644
> --- a/drivers/leds/leds-lm36274.c
> +++ b/drivers/leds/leds-lm36274.c
> @@ -74,7 +74,6 @@ static int lm36274_parse_dt(struct lm36274 *lm36274_data)
>  	struct device *dev = &lm36274_data->pdev->dev;
>  	const char *name;
>  	int child_cnt;
> -	int ret = -EINVAL;
>  
>  	/* There should only be 1 node */
>  	child_cnt = device_get_child_node_count(dev);
> @@ -82,6 +81,8 @@ static int lm36274_parse_dt(struct lm36274 *lm36274_data)
>  		return -EINVAL;
>  
>  	device_for_each_child_node(dev, child) {
> +		int ret;
> +
>  		ret = fwnode_property_read_string(child, "label", &name);
>  		if (ret)
>  			snprintf(label, sizeof(label),

this looks odd,
i would leave ret in place or move char *name also.

just my 2 cents,

re,
 wh
