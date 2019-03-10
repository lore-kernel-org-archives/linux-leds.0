From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH] leds: fix a potential NULL pointer dereference
Date: Sun, 10 Mar 2019 21:27:46 +0100
Message-ID: <8c616b91-8f0d-f53b-af10-4d768063c5a0@gmail.com>
References: <20190309060411.29074-1-kjlu@umn.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190309060411.29074-1-kjlu@umn.edu>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Kangjie Lu <kjlu@umn.edu>
Cc: pakki001@umn.edu, Riku Voipio <riku.voipio@iki.fi>, Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Hi Kangjie,

Thank you for the patch.

On 3/9/19 7:04 AM, Kangjie Lu wrote:
> In case of_match_device cannot find a match, the fixes returns
> -EINVAL to avoid NULL pointer dereference.
> 
> Signed-off-by: Kangjie Lu <kjlu@umn.edu>
> ---
>   drivers/leds/leds-pca9532.c | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/leds/leds-pca9532.c b/drivers/leds/leds-pca9532.c
> index 7fea18b0c15d..4b0335591728 100644
> --- a/drivers/leds/leds-pca9532.c
> +++ b/drivers/leds/leds-pca9532.c
> @@ -513,6 +513,7 @@ static int pca9532_probe(struct i2c_client *client,
>   	const struct i2c_device_id *id)
>   {
>   	int devid;
> +	const struct of_device_id *of_id;
>   	struct pca9532_data *data = i2c_get_clientdata(client);
>   	struct pca9532_platform_data *pca9532_pdata =
>   			dev_get_platdata(&client->dev);
> @@ -528,8 +529,11 @@ static int pca9532_probe(struct i2c_client *client,
>   			dev_err(&client->dev, "no platform data\n");
>   			return -EINVAL;
>   		}
> -		devid = (int)(uintptr_t)of_match_device(
> -			of_pca9532_leds_match, &client->dev)->data;
> +		of_id = of_match_device(of_pca9532_leds_match,
> +				&client->dev);
> +		if (unlikely(!of_id))
> +			return -EINVAL;
> +		devid = (int)of_id->data;
>   	} else {
>   		devid = id->driver_data;
>   	}


Applied to the for-5.2 branch of linux-leds.git.

-- 
Best regards,
Jacek Anaszewski
