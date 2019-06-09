From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH 04/34] leds: leds-pca955x: simplify getting the adapter of
 a client
Date: Sun, 9 Jun 2019 13:03:40 +0200
Message-ID: <e5a91999-a156-77b2-702b-8931140f0f8d@gmail.com>
References: <20190608105619.593-1-wsa+renesas@sang-engineering.com>
 <20190608105619.593-5-wsa+renesas@sang-engineering.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190608105619.593-5-wsa+renesas@sang-engineering.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-i2c@vger.kernel.org
Cc: Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Hi Wolfram,

Thank you for the patches.

On 6/8/19 12:55 PM, Wolfram Sang wrote:
> We have a dedicated pointer for that, so use it. Much easier to read and
> less computation involved.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> 
> Please apply to your subsystem tree.
> 
>   drivers/leds/leds-pca955x.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/leds/leds-pca955x.c b/drivers/leds/leds-pca955x.c
> index a9f5dad55956..460626d81c6a 100644
> --- a/drivers/leds/leds-pca955x.c
> +++ b/drivers/leds/leds-pca955x.c
> @@ -432,7 +432,7 @@ static int pca955x_probe(struct i2c_client *client,
>   	int ngpios = 0;
>   
>   	chip = &pca955x_chipdefs[id->driver_data];
> -	adapter = to_i2c_adapter(client->dev.parent);
> +	adapter = client->adapter;
>   	pdata = dev_get_platdata(&client->dev);
>   	if (!pdata) {
>   		pdata =	pca955x_get_pdata(client, chip);
> 

For both 4/34 and 5/34:

Acked-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>

-- 
Best regards,
Jacek Anaszewski
