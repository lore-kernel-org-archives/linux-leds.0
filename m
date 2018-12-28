From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: leds/lm3642: simplify error handling, remove user-triggerable
 errors
Date: Fri, 28 Dec 2018 18:14:06 +0100
Message-ID: <5f819f02-bcdf-76b4-0621-35d3f0efc28a@gmail.com>
References: <20181227195552.GB12008@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181227195552.GB12008@amd>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Hi Pavel,

Thank you for the patch.

On 12/27/18 8:55 PM, Pavel Machek wrote:
> Doing goto just to return is unneccessarily complex, simplify code a
> bit.
> 
> Drop dev_err()s that can be triggered by user.
> 
>      
> Signed-off-by: Pavel Machek <pavel@ucw.cz>
> 
> diff --git a/drivers/leds/leds-lm3642.c b/drivers/leds/leds-lm3642.c
> index cada084..62fc752 100644
> --- a/drivers/leds/leds-lm3642.c
> +++ b/drivers/leds/leds-lm3642.c
> @@ -110,7 +110,7 @@ static int lm3642_control(struct lm3642_chip_data *chip,
>   	ret = regmap_read(chip->regmap, REG_FLAG, &chip->last_flag);
>   	if (ret < 0) {
>   		dev_err(chip->dev, "Failed to read REG_FLAG Register\n");
> -		goto out;
> +		return ret;
>   	}
>   
>   	if (chip->last_flag)
> @@ -150,11 +150,11 @@ static int lm3642_control(struct lm3642_chip_data *chip,
>   		break;
>   
>   	default:
> -		return ret;
> +		return -EINVAL;
>   	}
>   	if (ret < 0) {
>   		dev_err(chip->dev, "Failed to write REG_I_CTRL Register\n");
> -		goto out;
> +		return ret;
>   	}
>   
>   	if (chip->tx_pin)
> @@ -163,13 +163,12 @@ static int lm3642_control(struct lm3642_chip_data *chip,
>   	ret = regmap_update_bits(chip->regmap, REG_ENABLE,
>   				 MODE_BITS_MASK << MODE_BITS_SHIFT,
>   				 opmode << MODE_BITS_SHIFT);

s/ret =/return/

> -out:
>   	return ret;
>   }
>   
>   /* torch */
>   
> -/* torch pin config for lm3642*/
> +/* torch pin config for lm3642 */
>   static ssize_t lm3642_torch_pin_store(struct device *dev,
>   				      struct device_attribute *attr,
>   				      const char *buf, size_t size)
> @@ -182,7 +181,7 @@ static ssize_t lm3642_torch_pin_store(struct device *dev,
>   
>   	ret = kstrtouint(buf, 10, &state);
>   	if (ret)
> -		goto out_strtoint;
> +		return ret;
>   	if (state != 0)
>   		state = 0x01 << TORCH_PIN_EN_SHIFT;
>   
> @@ -190,16 +189,12 @@ static ssize_t lm3642_torch_pin_store(struct device *dev,
>   	ret = regmap_update_bits(chip->regmap, REG_ENABLE,
>   				 TORCH_PIN_EN_MASK << TORCH_PIN_EN_SHIFT,
>   				 state);
> -	if (ret < 0)
> -		goto out;
> +	if (ret < 0) {
> +		dev_err(chip->dev, "%s:i2c access fail to register\n", __func__);
> +		return ret;
> +	}
>   
>   	return size;
> -out:
> -	dev_err(chip->dev, "%s:i2c access fail to register\n", __func__);
> -	return ret;
> -out_strtoint:
> -	dev_err(chip->dev, "%s: fail to change str to int\n", __func__);
> -	return ret;
>   }
>   
>   static DEVICE_ATTR(torch_pin, S_IWUSR, NULL, lm3642_torch_pin_store);
> @@ -233,7 +228,7 @@ static ssize_t lm3642_strobe_pin_store(struct device *dev,
>   
>   	ret = kstrtouint(buf, 10, &state);
>   	if (ret)
> -		goto out_strtoint;
> +		return ret;
>   	if (state != 0)
>   		state = 0x01 << STROBE_PIN_EN_SHIFT;
>   
> @@ -241,16 +236,12 @@ static ssize_t lm3642_strobe_pin_store(struct device *dev,
>   	ret = regmap_update_bits(chip->regmap, REG_ENABLE,
>   				 STROBE_PIN_EN_MASK << STROBE_PIN_EN_SHIFT,
>   				 state);
> -	if (ret < 0)
> -		goto out;
> +	if (ret < 0) {
> +		dev_err(chip->dev, "%s:i2c access fail to register\n", __func__);
> +		return ret;
> +	}
>   
>   	return size;
> -out:
> -	dev_err(chip->dev, "%s:i2c access fail to register\n", __func__);
> -	return ret;
> -out_strtoint:
> -	dev_err(chip->dev, "%s: fail to change str to int\n", __func__);
> -	return ret;
>   }
>   
>   static DEVICE_ATTR(strobe_pin, S_IWUSR, NULL, lm3642_strobe_pin_store);
> 

While we are at it I'd also switch to device managed LED registration
API.

-- 
Best regards,
Jacek Anaszewski
