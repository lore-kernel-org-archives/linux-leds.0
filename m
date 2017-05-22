From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH V1] leds: pca955x: Correct I2C Functionality
Date: Mon, 22 May 2017 21:02:29 +0200
Message-ID: <860beb3d-67e5-2e01-c430-897759633ec9@gmail.com>
References: <1495444760-7626-1-git-send-email-tnhuynh@apm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:35150 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1760735AbdEVTDQ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 22 May 2017 15:03:16 -0400
In-Reply-To: <1495444760-7626-1-git-send-email-tnhuynh@apm.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Tin Huynh <tnhuynh@apm.com>, Richard Purdie <rpurdie@rpsys.net>, Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Loc Ho <lho@apm.com>, Phong Vo <pvo@apm.com>, Thang Nguyen <tqnguyen@apm.com>, patches@apm.com

Hi Tin,

On 05/22/2017 11:19 AM, Tin Huynh wrote:
> The driver checks an incorrect flag of functionality of adapter.
> When a driver requires i2c_smbus_read_byte_data and
> i2c_smbus_write_byte_data, it should check I2C_FUNC_SMBUS_BYTE_DATA
> instead I2C_FUNC_I2C.
> This patch fixes the problem.
> 
> Signed-off-by: Tin Huynh <tnhuynh@apm.com>
> ---
>  drivers/leds/leds-pca955x.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/drivers/leds/leds-pca955x.c b/drivers/leds/leds-pca955x.c
> index 78a7ce8..9a87311 100644
> --- a/drivers/leds/leds-pca955x.c
> +++ b/drivers/leds/leds-pca955x.c
> @@ -285,7 +285,7 @@ static int pca955x_probe(struct i2c_client *client,
>  			"slave address 0x%02x\n",
>  			client->name, chip->bits, client->addr);
>  
> -	if (!i2c_check_functionality(adapter, I2C_FUNC_I2C))
> +	if (!i2c_check_functionality(adapter, I2C_FUNC_SMBUS_BYTE_DATA))
>  		return -EIO;
>  
>  	if (pdata) {
> 

Applied to the fixes-for-4.12rc3 branch of linux-leds.git, thanks.

-- 
Best regards,
Jacek Anaszewski
