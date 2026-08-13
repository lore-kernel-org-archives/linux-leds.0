Received: from mta1.migadu.com (out-72.mta1.migadu.com [95.215.58.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 139903E51C8
	for <linux-leds@vger.kernel.org>; Thu, 13 Aug 2026 22:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786659654; cv=none; b=Yvsuu2+iMEP1f7r3Yh4u7XKm+uhoNa5CkR2bRQf1dhMdKDMXbvudii/tkAqqvdLXBcv5mNB+6SH0pnD6GZIAqGA4IUkRzzmImMF45aqZ0mrREP4p5qX3CtY3uY1Ua7QH2XLkLT/PSNCvG9RlC6Yf9pgW2uXllImgU4g/O3SJTA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786659654; c=relaxed/simple;
	bh=8zjnPm8jnp2UyHvUcXFNks/0Z1YacLNwobfNYJaRWAY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PsVR9N+Rd/MUHZtGH6fJrDKf2O21GmCm8f2HZhrVKXH/4zjNFKw8o7ufzNlPhx8e5jzOYzQ+eevmtJGBlgNNQY2GS7mRxB/Yyb6toqkZevBXApt2LjFzNpgXz6wXMUROz22LOrULF0vRGx4eFV65VTD4HEyteLtYd3OukJGSKy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ngTnowR+; arc=none smtp.client-ip=95.215.58.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ngTnowR+"
X-Envelope-To: linux-leds@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=8zjnPm8jnp2UyHvUcXFNks/0Z1YacLNwobfNYJaRWAY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1786659650; v=1; x=1787264450;
 b=ngTnowR+eIkYO76am4GK3HUSxaKl85g9iO0NhFNlijv/YKOfGkCgFBZFhmGxSR8oeuyYTNd6
 q32zd8FBHlzAtsXrhFdFAGiwA62Z2KaSdVGlHOHez3D9VW0Phs+KCGKDCG3GYAFILXTvQHyYGk1
 kMsR0i4jU9QtC9J3JoKj66wo=
X-Envelope-To: linux-leds@vger.kernel.org
Received: from [192.168.1.24] (64.43.42.247)
	by smtp.migadu.com with ESMTPS id ce82665f9555d537;
	Thu, 13 Aug 2026 22:20:39 +0000
X-Migadu-Flow: FLOW_OUT
Message-ID: <62242142-0d27-425c-88d6-db65e80bbcea@linux.dev>
Date: Thu, 13 Aug 2026 23:20:38 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v4 4/5] ptp: ocp: Add R4006 I2C peripheral
 topology
To: Ahmad Byagowi <ahmadexp@gmail.com>, netdev@vger.kernel.org
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Nam Tran <trannamatk@gmail.com>,
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Peter Rosin <peda@lysator.liu.se>, Andi Shyti <andi.shyti@kernel.org>,
 Richard Cochran <richardcochran@gmail.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org
References: <cover.1786543681.git.ahmadexp@gmail.com>
 <9b73c41a9f94482227af5879b11747668fe9af51.1786543681.git.ahmadexp@gmail.com>
Content-Language: en-US
From: Vadim Fedorenko <vadim.fedorenko@linux.dev>
In-Reply-To: <9b73c41a9f94482227af5879b11747668fe9af51.1786543681.git.ahmadexp@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/08/2026 15:17, Ahmad Byagowi wrote:
> R4006 cards place a PCA9546 mux behind the FPGA I2C controller.
> The mux exposes three LM75B temperature sensors, an SHT3x humidity
> sensor, an ICP10100 pressure sensor, and an IS32FL3207 controller for
> the GNSS and SMA LEDs.
> 
> Describe the per-card topology with software nodes and instantiate
> standard I2C clients after their adapters appear. Keep the mux channel,
> RISET value, and per-output current limit in the board profile, and
> validate every profile index before constructing nodes.
> 
> Select the profile only on supported Time Card PCI devices whose
> fixed-width EEPROM ID contains printable text, valid zero or 0xff
> padding, and an R4006 prefix. Leave erased, malformed, and unknown IDs
> unconfigured without changing the EEPROM data.
> 
> Leave the channel containing the BNO08x empty because no upstream
> driver exists. Serialize topology changes with a private mutex and
> stable device references. Retry transient setup failures, report
> exhaustion once, and continue low-rate recovery so late adapter or
> client availability can still complete setup.
> 
> Signed-off-by: Ahmad Byagowi <ahmadexp@gmail.com>
> ---
>   drivers/ptp/ptp_ocp.c | 810 +++++++++++++++++++++++++++++++++++++++---
>   1 file changed, 764 insertions(+), 46 deletions(-)

Hi Ahmad,
It's partial review, because this patch mixes a lot of things. Consider
split it into multiple smaller changes to make review process a bit
easier.


[...]

> @@ -414,6 +483,15 @@ struct ptp_ocp {
>   	const struct ocp_sma_op *sma_op;
>   	struct dpll_device *dpll;
>   	dpll_tracker tracker;
> +	const struct ptp_ocp_i2c_profile *i2c_profile;
> +	struct ptp_ocp_i2c_topology *i2c_topology;
> +	struct mutex i2c_topology_lock; /* Serializes topology updates. */
> +	struct delayed_work i2c_work;
> +	struct notifier_block i2c_notifier;
> +	atomic_t i2c_retry_count;

atomic field in per-device structure? (later more on this)

> +	bool i2c_root_present;
> +	bool i2c_resources_ready;
> +	bool i2c_notifier_registered;
>   	int signals_nr;
>   	int freq_in_nr;
>   };
> @@ -444,6 +522,8 @@ static int ptp_ocp_signal_from_perout(struct ptp_ocp *bp, int gen,
>   				      struct ptp_perout_request *req);
>   static int ptp_ocp_signal_enable(void *priv, u32 req, bool enable);
>   static int ptp_ocp_sma_store(struct ptp_ocp *bp, const char *buf, int sma_nr);
> +static int ptp_ocp_i2c_notifier_call(struct notifier_block *nb,
> +				     unsigned long action, void *data);
>   
>   static int ptp_ocp_art_board_init(struct ptp_ocp *bp, struct ocp_resource *r);
>   
> @@ -488,6 +568,68 @@ static struct ptp_ocp_eeprom_map art_eeprom_map[] = {
>   	{ }
>   };
>   
> +/* Channel 3's BNO08x at 0x4a has no upstream Linux driver, so omit it. */

comment says omit 0x4a ...

> +static const struct ptp_ocp_i2c_device ptp_ocp_r4006_sensors[] = {
> +	{ "temperature@48", "national,lm75b", "lm75b", 0, 0x48 },
> +	{ "temperature@49", "national,lm75b", "lm75b", 0, 0x49 },
> +	{ "temperature@4a", "national,lm75b", "lm75b", 0, 0x4a },

... but you still put temperature sensor on 0x4a?

> +	{ "humidity@44", NULL, "sht3x", 1, 0x44 },
> +	{ "pressure@63", "invensense,icp10100", "icp10100", 2, 0x63 },
> +};
> +

[...]

>   
> -static void
> +static bool
> +ptp_ocp_has_eeprom_data(struct ptp_ocp *bp)
> +{
> +	return smp_load_acquire(&bp->has_eeprom_data);
> +}

not sure it makes any sense to have one-line helper

> +
> +static int
>   ptp_ocp_read_eeprom(struct ptp_ocp *bp)
>   {
>   	const struct ptp_ocp_eeprom_map *map;
>   	struct nvmem_device *nvmem;
>   	const void *tag;
> -	int ret;
> -
> -	if (!bp->i2c_ctrl)
> -		return;
> +	int ret = 0;
>   
>   	tag = NULL;
>   	nvmem = NULL;
> +	mutex_lock(&bp->eeprom_lock);
> +	if (ptp_ocp_has_eeprom_data(bp))
> +		goto out;

why do you need any smp_load_acquire semantic under mutex lock?

> +	if (!bp->i2c_ctrl || !bp->eeprom_map) {
> +		ret = -ENODEV;
> +		goto out;
> +	}
>   
>   	for (map = bp->eeprom_map; map->len; map++) {
>   		if (map->tag != tag) {
> @@ -1997,21 +2149,536 @@ ptp_ocp_read_eeprom(struct ptp_ocp *bp)
>   		}
>   		ret = nvmem_device_read(nvmem, map->off, map->len,
>   					BP_MAP_ENTRY_ADDR(bp, map));
> -		if (ret != map->len)
> +		if (ret != map->len) {
> +			if (ret >= 0)

well, there is no way ret can be 0 if map->len > 0.

> +				ret = -EIO;
>   			goto fail;
> +		}
>   	}
>   
> -	bp->has_eeprom_data = true;
> +	/* Publish the EEPROM fields before readers observe valid data. */
> +	smp_store_release(&bp->has_eeprom_data, true);
> +	ret = 0;
>   
>   out:
>   	ptp_ocp_nvmem_device_put(&nvmem);
> -	return;
> +	mutex_unlock(&bp->eeprom_lock);
> +	return ret;
>   
>   fail:
> -	dev_err(&bp->pdev->dev, "could not read eeprom: %d\n", ret);
>   	goto out;

"fail" label just to go to "out"? remove it..

>   }
>   
> +static int
> +ptp_ocp_i2c_adapter_match(struct device *dev, const void *data)
> +{
> +	return !!i2c_verify_adapter(dev);
> +}
> +
> +static struct i2c_adapter *
> +ptp_ocp_i2c_root_adapter(struct platform_device *i2c_ctrl)
> +{
> +	struct i2c_adapter *adapter;
> +	struct device *dev;
> +
> +	dev = device_find_child(&i2c_ctrl->dev, NULL,
> +				ptp_ocp_i2c_adapter_match);
> +	if (!dev)
> +		return NULL;
> +
> +	adapter = i2c_verify_adapter(dev);
> +	if (!adapter || !try_module_get(adapter->owner)) {

device_find_child just checked that i2c_verify_adapter returns valid 
pointer...

> +		put_device(dev);
> +		return NULL;
> +	}
> +
> +	/* The caller owns the reference returned by device_find_child(). */
> +	return adapter;
> +}
> +
> +static bool
> +ptp_ocp_i2c_supported(struct ptp_ocp *bp)
> +{
> +	/* PCI IDs identify FPGA images, not a unique PCB revision. */
> +	return (bp->pdev->vendor == PCI_VENDOR_ID_META &&
> +		bp->pdev->device == PCI_DEVICE_ID_META_TIMECARD) ||
> +	       (bp->pdev->vendor == PCI_VENDOR_ID_CELESTICA &&
> +		bp->pdev->device == PCI_DEVICE_ID_CELESTICA_TIMECARD);
> +}
> +
> +static bool
> +ptp_ocp_board_id_valid(const u8 *board_id, size_t *text_len)
> +{
> +	unsigned int len;
> +
> +	for (len = 0; len < OCP_BOARD_ID_LEN; len++)
> +		if (board_id[len] < 0x20 || board_id[len] > 0x7e)
> +			break;
> +
> +	if (!len)
> +		return false;
> +
> +	*text_len = len;
> +	for (; len < OCP_BOARD_ID_LEN; len++)
> +		if (board_id[len] != 0 && board_id[len] != 0xff)
> +			return false;
> +
> +	return true;
> +}
> +
> +static const struct ptp_ocp_i2c_profile *
> +ptp_ocp_i2c_select_profile(struct ptp_ocp *bp)
> +{
> +	static const char r4006_id[] = "R4006";
> +	size_t board_id_len;
> +
> +	if (!ptp_ocp_has_eeprom_data(bp))
> +		return NULL;
> +
> +	if (!ptp_ocp_board_id_valid(bp->board_id, &board_id_len))
> +		return NULL;
> +
> +	if (board_id_len >= sizeof(r4006_id) - 1 &&
> +	    !memcmp(bp->board_id, r4006_id, sizeof(r4006_id) - 1))
> +		return &ptp_ocp_r4006_profile;
> +
> +	return NULL;
> +}

that doesn't verify for a valid board id, but just for a alpha-numeric
crap with prefix. effectively can be replaced with a single memcmp() of
prefix string.



[...]

> +static void
> +ptp_ocp_i2c_kick(struct ptp_ocp *bp)
> +{
> +	if (!ptp_ocp_i2c_supported(bp))
> +		return;
> +	if (!READ_ONCE(bp->i2c_resources_ready))
> +		return;
> +	if (!READ_ONCE(bp->i2c_root_present))
> +		return;
> +
> +	mod_delayed_work(system_wq, &bp->i2c_work, 1);
> +}
> +
> +static void
> +ptp_ocp_i2c_retry(struct ptp_ocp *bp, int error)
> +{
> +	unsigned long delay = HZ;
> +	int retries;
> +
> +	if (!READ_ONCE(bp->i2c_resources_ready))
> +		return;
> +	if (!READ_ONCE(bp->i2c_root_present))
> +		return;
> +
> +	retries = atomic_inc_return(&bp->i2c_retry_count);
> +	if (retries >= OCP_I2C_RETRY_MAX) {
> +		if (retries == OCP_I2C_RETRY_MAX) {
> +			dev_err(&bp->pdev->dev,
> +				"I2C topology failed after %d attempts: %pe; "
> +				"retrying every %d seconds\n",
> +				OCP_I2C_RETRY_MAX, ERR_PTR(error),
> +				OCP_I2C_RECOVERY_SECS);
> +		} else {
> +			atomic_set(&bp->i2c_retry_count, OCP_I2C_RETRY_MAX);
> +			dev_err_ratelimited(&bp->pdev->dev,
> +					    "I2C topology setup still failing: %pe\n",
> +					    ERR_PTR(error));
> +		}
> +		delay = OCP_I2C_RECOVERY_SECS * HZ;
> +	}
> +
> +	/* Preserve a faster rerun queued by an I2C bus notification. */
> +	queue_delayed_work(system_wq, &bp->i2c_work, delay);
> +}
> +
> +static int
> +ptp_ocp_i2c_populate_topology(struct ptp_ocp *bp,
> +			      struct platform_device *i2c_ctrl)
> +{
> +	const struct software_node *node;
> +	struct i2c_adapter *adapter;
> +	unsigned int channel;
> +	int err, ret = 0;
> +
> +	if (!READ_ONCE(bp->i2c_root_present))
> +		return 0;
> +	if (!ptp_ocp_i2c_supported(bp) || !bp->eeprom_map)
> +		return 0;
> +
> +	adapter = ptp_ocp_i2c_root_adapter(i2c_ctrl);
> +	if (!adapter)
> +		return -EAGAIN;
> +
> +	if (!ptp_ocp_has_eeprom_data(bp)) {
> +		ret = ptp_ocp_read_eeprom(bp);
> +		if (ret)
> +			goto out_put_adapter;
> +	}
> +	if (!ptp_ocp_has_eeprom_data(bp)) {
> +		ret = -EAGAIN;
> +		goto out_put_adapter;
> +	}
> +	if (!bp->i2c_profile)
> +		bp->i2c_profile = ptp_ocp_i2c_select_profile(bp);
> +	if (!bp->i2c_profile)
> +		goto out_put_adapter;
> +
> +	ret = ptp_ocp_i2c_init_nodes(bp);
> +	if (ret)
> +		goto out_put_adapter;
> +
> +	node = &bp->i2c_topology->mux_node;
> +	ret = ptp_ocp_i2c_add_device(adapter, node, OCP_I2C_MUX_TYPE,
> +				     OCP_I2C_MUX_ADDRESS);
> +	if (ret)
> +		goto out_put_adapter;
> +
> +	for (channel = 0; channel < OCP_I2C_MUX_CHANNELS; channel++) {
> +		err = ptp_ocp_i2c_populate_channel(bp, channel);
> +		if (err && !ret)
> +			ret = err;
> +	}
> +
> +out_put_adapter:
> +	i2c_put_adapter(adapter);
> +	return ret;
> +}
> +
> +static void
> +ptp_ocp_i2c_work(struct work_struct *work)
> +{
> +	struct ptp_ocp *bp = container_of(work, struct ptp_ocp, i2c_work.work);
> +	struct platform_device *i2c_ctrl;
> +	struct device *i2c_ctrl_dev;
> +	int retries, ret = 0;
> +
> +	/* Pair with resource publication after registration. */
> +	if (!smp_load_acquire(&bp->i2c_resources_ready))
> +		return;
> +	if (!ptp_ocp_i2c_supported(bp))
> +		return;
> +
> +	mutex_lock(&bp->i2c_topology_lock);
> +	if (!READ_ONCE(bp->i2c_resources_ready) ||
> +	    !READ_ONCE(bp->i2c_root_present)) {
> +		mutex_unlock(&bp->i2c_topology_lock);
> +		return;
> +	}
> +
> +	i2c_ctrl = READ_ONCE(bp->i2c_ctrl);
> +	if (!i2c_ctrl) {
> +		ret = -EAGAIN;
> +		goto out_unlock;
> +	}
> +
> +	i2c_ctrl_dev = get_device(&i2c_ctrl->dev);
> +	ret = ptp_ocp_i2c_populate_topology(bp, i2c_ctrl);
> +	put_device(i2c_ctrl_dev);
> +
> +out_unlock:
> +	mutex_unlock(&bp->i2c_topology_lock);
> +
> +	if (ret) {
> +		ptp_ocp_i2c_retry(bp, ret);
> +		return;
> +	}
> +
> +	retries = atomic_xchg(&bp->i2c_retry_count, 0);

so basically there is delayes work to explore i2c bus. and it cannot run
multiple times in parallel. what else is expected to change
i2c_retry_count? why is it needed? why is it atomic?


> +	if (retries >= OCP_I2C_RETRY_MAX)
> +		dev_info(&bp->pdev->dev, "I2C topology setup recovered\n");
> +}
