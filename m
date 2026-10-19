Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE5C257EDB0;
	Mon, 19 Oct 2026 14:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792420465; cv=none; b=r7cP6H1vrJN3XXH2wGJG4WQ/2fCJVarKkfVhTQmCTmzIqbAkRduHhQIdJ7CbFnDOtfyqmyDpOZCuUp9C0TQW7WX0fpy33zpFCBPyGsA2+FSvmUO4eseBSwRaDUjxtezJQ1djF4ihokW0E/hi3umOdwXSQhd+neaW06hzl26XbiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792420465; c=relaxed/simple;
	bh=rO/r2V0/kVwlqtISomYjdf7IBt9kzgGfVCifZcbYJpg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h8y0RPYhJZ1QDaLLdwSC9vLP8oiC8XUEuETOFMaYrHz/YDF/Cwgd/z6F+OAN6P7PO3OgJMKOX+suSwyrAdGiydwIH1uLmIsd/gxfrqOlUJIG8z48JOBYOfv6XryKsAw3TbfTjkYYhHa9KF+RyQTdki5JSPGfqCRhBG8nVxuaaWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i/77oUwa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i/77oUwa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71AEE1F000C4;
	Mon, 19 Oct 2026 14:34:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792420464;
	bh=1dZ1l0HE54UnJHOSCSJM8tvbxKuy8lheEm7lVqiEf5Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=i/77oUwaR4CdhMAVd6gUGIWePiqqZObfOZj4gu1EMJKABBgxEvtSLLXB1aYQ908D8
	 YH9odf7HPI1nlmMKoHuk5HEotQI7F3Rn8r6xY/SdvhdrJ70oxvbjlAyHNwYMjrMqR4
	 KH7EsFVxqxYqSNtwFbWfEMckZHo/LuwBh/vGcPaxk6Xkge583p/S3x+ukNKcVksG+c
	 m2KyrNB7wjQ1jbwBkdNvyqXUIqwQk5TSx8YLWmWIdsYZjuuyD7KuJu5ViIaQJyg5u2
	 L0Wpx8ArQ/DU4qKFXrXNVQbqSUBVGGMSq71oSCMC+hlLg+crDono7O9YfHccbZGQo6
	 BUk4HJh13gtKQ==
Date: Mon, 19 Oct 2026 15:34:18 +0100
From: Lee Jones <lee@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] leds: rgb: qcom-lpg: add qcom,pmk8850-pwm compatible
Message-ID: <179213351749.2581328.3338477962958404050@kernel.org>
References: <20261015194732.64428-1-srinivas.kandagatla@oss.qualcomm.com>
 <20261015194732.64428-3-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261015194732.64428-3-srinivas.kandagatla@oss.qualcomm.com>
X-AI-Review-Draft: <20261015194732.64428-3-srinivas.kandagatla@oss.qualcomm.com>

--- checkpatch.pl (1 issue) ---
Line 23: WARNING: DT compatible string "qcom,pmk8850-pwm" appears un-documented -- check ./Documentation/devicetree/bindings/
----------------------------------

On Thu, 15 Oct 2026, Srinivas Kandagatla wrote:

> The PMK8850 sleep-clock PMIC on Snapdragon X2 Elite (Mahua) exposes
> the same two-channel LPG/PWM block as PMK8550 at 0xe800/0xe900, so
> reuse pmk8550_pwm_data.
>
> Used on the Lenovo ThinkPad T14s Gen 7 to drive the eDP backlight
> (EDP_BL/PWMR_BV_PS).
>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---
>  drivers/leds/rgb/leds-qcom-lpg.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/leds/rgb/leds-qcom-lpg.c b/drivers/leds/rgb/leds-qcom-lpg.c
> index 24ffe079f221..485fa2a7a848 100644
> --- a/drivers/leds/rgb/leds-qcom-lpg.c
> +++ b/drivers/leds/rgb/leds-qcom-lpg.c
> @@ -1837,6 +1837,7 @@ static const struct of_device_id lpg_of_table[] = {
>  	{ .compatible = "qcom,pmi8998-lpg", .data = &pmi8998_lpg_data },
>  	{ .compatible = "qcom,pmc8180c-lpg", .data = &pm8150l_lpg_data },
>  	{ .compatible = "qcom,pmk8550-pwm", .data = &pmk8550_pwm_data },
> +	{ .compatible = "qcom,pmk8850-pwm", .data = &pmk8550_pwm_data },

If PMK8850 is completely compatible with PMK8550, why are we adding a
new match entry here instead of using 'qcom,pmk8550-pwm' as a fallback
compatible?

>  	{}
>  };
>  MODULE_DEVICE_TABLE(of, lpg_of_table);
> -- 
> 2.53.0
>
>

-- 
Lee Jones
