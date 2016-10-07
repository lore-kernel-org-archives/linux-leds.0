From: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Subject: [PATCH 05/10] gpio: i2cs: Juniper I2CS to GPIO pin mapping driver
Date: Fri,  7 Oct 2016 18:21:04 +0300
Message-ID: <1475853669-22480-6-git-send-email-pantelis.antoniou@konsulko.com>
References: <1475853669-22480-1-git-send-email-pantelis.antoniou@konsulko.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1475853669-22480-1-git-send-email-pantelis.antoniou@konsulko.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Frank Rowand <frowand.list@gmail.com>, Wolfram Sang <wsa@the-dreams.de>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, Jean Delvare <jdelvare@suse.com>, Peter Rosin <peda@axentia.se>, Avirup Banerjee <abanerjee@juniper.net>, Georgi Vlaev <gvlaev@juniper.net>, Guenter Roeck <linux@roeck-us.net>, JawaharBalaji Thirumalaisamy <jawaharb@juniper.net>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org, linux-leds@vger.kernel.org, linux-hwmon@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

From: Guenter Roeck <groeck@juniper.net>

This driver maps I2C slave register bits to GPIO pins. Registers
are supposed to be 8 bit wide. Interrupt support is optional.

The driver is implemented as client of the I2CS MFD driver.

Signed-off-by: Georgi Vlaev <gvlaev@juniper.net>
Signed-off-by: Guenter Roeck <groeck@juniper.net>
Signed-off-by: JawaharBalaji Thirumalaisamy <jawaharb@juniper.net>
[Ported from Juniper kernel]
Signed-off-by: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
---
 drivers/gpio/Kconfig         |  11 +
 drivers/gpio/Makefile        |   1 +
 drivers/gpio/gpio-jnx-i2cs.c | 523 +++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 535 insertions(+)
 create mode 100644 drivers/gpio/gpio-jnx-i2cs.c

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index ef8f408..34840e9 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -746,6 +746,17 @@ config GPIO_ADNP
 	  enough to represent all pins, but the driver will assume a
 	  register layout for 64 pins (8 registers).
 
+config GPIO_JNX_I2CS
+	tristate "Juniper I2C slave GPIO driver"
+	depends on I2C
+	depends on MFD_JUNIPER_I2CS
+	help
+	  This driver maps I2C slave register bits to GPIO pins.
+	  Mapping is configured through devicetree data.
+
+	  This driver can also be built as a module.  If so, the module
+	  will be called gpio-jnx-i2cs.
+
 config GPIO_MAX7300
 	tristate "Maxim MAX7300 GPIO expander"
 	select GPIO_MAX730X
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index 825c2636..06d5d51 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -55,6 +55,7 @@ obj-$(CONFIG_GPIO_ICH)		+= gpio-ich.o
 obj-$(CONFIG_GPIO_IOP)		+= gpio-iop.o
 obj-$(CONFIG_GPIO_IT87)		+= gpio-it87.o
 obj-$(CONFIG_GPIO_JANZ_TTL)	+= gpio-janz-ttl.o
+obj-$(CONFIG_GPIO_JNX_I2CS)	+= gpio-jnx-i2cs.o
 obj-$(CONFIG_GPIO_KEMPLD)	+= gpio-kempld.o
 obj-$(CONFIG_ARCH_KS8695)	+= gpio-ks8695.o
 obj-$(CONFIG_GPIO_INTEL_MID)	+= gpio-intel-mid.o
diff --git a/drivers/gpio/gpio-jnx-i2cs.c b/drivers/gpio/gpio-jnx-i2cs.c
new file mode 100644
index 0000000..3a87b6a
--- /dev/null
+++ b/drivers/gpio/gpio-jnx-i2cs.c
@@ -0,0 +1,523 @@
+/*
+ * I2C -> GPIO mapping driver
+ * Copyright (c) 2013 Juniper Networks
+ *
+ * Derived from gpio-adnp.c
+ * Copyright (C) 2011-2012 Avionic Design GmbH
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+#include <linux/gpio.h>
+#include <linux/i2c.h>
+#include <linux/interrupt.h>
+#include <linux/irqdomain.h>
+#include <linux/module.h>
+#include <linux/of_irq.h>
+#include <linux/seq_file.h>
+#include <linux/slab.h>
+#include <linux/platform_device.h>
+
+struct i2c_gpio_map {
+	u8 reg;		/* register offset			*/
+	u8 direction;	/* direction (in/out) for each bit	*/
+	u8 value;	/* cached value				*/
+	u8 irq_enable;
+	u8 irq_level;
+	u8 irq_rise;
+	u8 irq_fall;
+	u8 irq_high;
+	u8 irq_low;
+};
+
+struct i2cs_gpio {
+	struct i2c_client *client;	/* platform's device parent client */
+	struct device *dev;		/* our device */
+	struct gpio_chip gpio;
+	int irq;
+
+	struct mutex i2c_lock;
+
+	struct irq_domain *domain;
+	struct mutex irq_lock;
+
+	struct delayed_work work;
+
+	int num_regs;
+	struct i2c_gpio_map *map;
+};
+
+static inline struct i2cs_gpio *to_i2cs_gpio(struct gpio_chip *chip)
+{
+	return container_of(chip, struct i2cs_gpio, gpio);
+}
+
+static int i2cs_gpio_read_byte_data(struct i2c_client *client, u8 reg)
+{
+	int val, retries;
+
+	/*
+	 * i2c slave reads fail once in a while for no obvious reason.
+	 * Retry on any error code.
+	 */
+	for (retries = 0; retries < 10; retries++) {
+		val = i2c_smbus_read_byte_data(client, reg);
+		if (val >= 0)
+			break;
+	}
+	return val;
+}
+
+static int i2cs_gpio_gpio_get(struct gpio_chip *chip, unsigned int offset)
+{
+	struct i2cs_gpio *i2cs_gpio = to_i2cs_gpio(chip);
+	struct i2c_gpio_map *map = &i2cs_gpio->map[offset >> 3];
+	struct i2c_client *client = i2cs_gpio->client;
+	u8 pos = offset & 7;
+	u8 reg = map->reg;
+	int val;
+
+	val = i2cs_gpio_read_byte_data(client, reg);
+	if (val < 0)
+		return val;
+
+	map->value = val;
+
+	return !!(val & BIT(pos));
+}
+
+static void __i2cs_gpio_gpio_set(struct i2cs_gpio *i2cs_gpio,
+				 unsigned int offset, int value)
+{
+	struct i2c_gpio_map *map = &i2cs_gpio->map[offset >> 3];
+	struct i2c_client *client = i2cs_gpio->client;
+	u8 pos = offset & 7;
+	u8 reg = map->reg;
+	int val;
+
+	val = i2cs_gpio_read_byte_data(client, reg);
+	if (val < 0)
+		return;
+
+	if (value)
+		val |= BIT(pos);
+	else
+		val &= ~BIT(pos);
+
+	map->value = val;
+	i2c_smbus_write_byte_data(client, reg, val);
+}
+
+static void i2cs_gpio_gpio_set(struct gpio_chip *chip,
+			       unsigned int offset, int value)
+{
+	struct i2cs_gpio *i2cs_gpio = to_i2cs_gpio(chip);
+
+	mutex_lock(&i2cs_gpio->i2c_lock);
+	__i2cs_gpio_gpio_set(i2cs_gpio, offset, value);
+	mutex_unlock(&i2cs_gpio->i2c_lock);
+}
+
+static int i2cs_gpio_gpio_direction_input(struct gpio_chip *chip,
+					  unsigned int offset)
+{
+	struct i2cs_gpio *i2cs_gpio = to_i2cs_gpio(chip);
+	struct i2c_gpio_map *map = &i2cs_gpio->map[offset >> 3];
+	u8 pos = offset & 7;
+
+	/*
+	 * Direction is determined by devicetree data and can not be
+	 * overwritten.
+	 */
+	return (map->direction & BIT(pos)) ? 0 : -EACCES;
+}
+
+static int i2cs_gpio_gpio_direction_output(struct gpio_chip *chip,
+					   unsigned int offset, int value)
+{
+	struct i2cs_gpio *i2cs_gpio = to_i2cs_gpio(chip);
+	struct i2c_gpio_map *map = &i2cs_gpio->map[offset >> 3];
+	u8 pos = offset & 7;
+
+	/*
+	 * Direction is determined by devicetree data and can not be
+	 * overwritten.
+	 */
+	return (map->direction & BIT(pos)) ? -EACCES : 0;
+}
+
+static int i2cs_gpio_gpio_setup(struct i2cs_gpio *i2cs_gpio,
+				unsigned int num_gpios)
+{
+	struct gpio_chip *chip = &i2cs_gpio->gpio;
+	struct i2c_client *client = i2cs_gpio->client;
+	char *name;
+
+	name = devm_kzalloc(i2cs_gpio->dev, 64, GFP_KERNEL);
+	if (!name)
+		return -ENOMEM;
+
+	scnprintf(name, 64, "%s-%d-%02x", dev_name(i2cs_gpio->dev),
+		  i2c_adapter_id(client->adapter), client->addr);
+
+	chip->direction_input = i2cs_gpio_gpio_direction_input;
+	chip->direction_output = i2cs_gpio_gpio_direction_output;
+	chip->get = i2cs_gpio_gpio_get;
+	chip->set = i2cs_gpio_gpio_set;
+	chip->can_sleep = 1;
+
+	chip->base = -1;
+	chip->ngpio = num_gpios;
+	chip->label = name;
+	chip->parent = i2cs_gpio->dev;
+	chip->of_node = chip->parent->of_node;
+	chip->owner = THIS_MODULE;
+
+	return 0;
+}
+
+static void i2cs_gpio_irq_work(struct i2cs_gpio *i2cs_gpio)
+{
+	unsigned int i;
+
+	for (i = 0; i < i2cs_gpio->num_regs; i++) {
+		struct i2c_gpio_map *map = &i2cs_gpio->map[i];
+		unsigned int base = i << 3, bit;
+		unsigned long pending;
+		u8 changed, level;
+
+		/* Don't read from i2c bus if interrupts are disabled */
+		if (!map->irq_enable)
+			continue;
+
+		level = i2cs_gpio_read_byte_data(i2cs_gpio->client, map->reg);
+		if (level < 0)
+			continue;
+
+		/* determine if bit changed levels */
+		changed = level ^ map->value;
+
+		/* compute edge-triggered interrupts */
+		pending = changed & ((map->irq_fall & ~level) |
+				     (map->irq_rise & level));
+
+		/* add in level-triggered interrupts */
+		pending |= (map->irq_high & level) |
+			   (map->irq_low & ~level);
+
+		/* mask out disabled interrupts */
+		pending &= map->irq_enable;
+
+		for_each_set_bit(bit, &pending, 8) {
+			unsigned int virq;
+
+			virq = irq_find_mapping(i2cs_gpio->domain, base + bit);
+			handle_nested_irq(virq);
+		}
+		map->value = level;
+	}
+}
+
+static irqreturn_t i2cs_gpio_irq_handler(int irq, void *data)
+{
+	i2cs_gpio_irq_work(data);
+
+	return IRQ_HANDLED;
+}
+
+static void i2cs_gpio_worker(struct work_struct *work)
+{
+	struct i2cs_gpio *i2cs_gpio;
+
+	i2cs_gpio = container_of(work, struct i2cs_gpio, work.work);
+	i2cs_gpio_irq_work(i2cs_gpio);
+	schedule_delayed_work(&i2cs_gpio->work, msecs_to_jiffies(100));
+}
+
+static int i2cs_gpio_gpio_to_irq(struct gpio_chip *chip, unsigned int offset)
+{
+	struct i2cs_gpio *i2cs_gpio = to_i2cs_gpio(chip);
+
+	return irq_create_mapping(i2cs_gpio->domain, offset);
+}
+
+static void i2cs_gpio_irq_mask(struct irq_data *data)
+{
+	struct i2cs_gpio *i2cs_gpio = irq_data_get_irq_chip_data(data);
+	struct i2c_gpio_map *map = &i2cs_gpio->map[data->hwirq >> 3];
+	unsigned int pos = data->hwirq & 7;
+
+	map->irq_enable &= ~BIT(pos);
+}
+
+static void i2cs_gpio_irq_unmask(struct irq_data *data)
+{
+	struct i2cs_gpio *i2cs_gpio = irq_data_get_irq_chip_data(data);
+	struct i2c_gpio_map *map = &i2cs_gpio->map[data->hwirq >> 3];
+	unsigned int pos = data->hwirq & 7;
+
+	map->irq_enable |= BIT(pos);
+}
+
+static int i2cs_gpio_irq_set_type(struct irq_data *data, unsigned int type)
+{
+	struct i2cs_gpio *i2cs_gpio = irq_data_get_irq_chip_data(data);
+	struct i2c_gpio_map *map = &i2cs_gpio->map[data->hwirq >> 3];
+	unsigned int pos = data->hwirq & 7;
+
+	if (type & IRQ_TYPE_EDGE_RISING)
+		map->irq_rise |= BIT(pos);
+	else
+		map->irq_rise &= ~BIT(pos);
+
+	if (type & IRQ_TYPE_EDGE_FALLING)
+		map->irq_fall |= BIT(pos);
+	else
+		map->irq_fall &= ~BIT(pos);
+
+	if (type & IRQ_TYPE_LEVEL_HIGH)
+		map->irq_high |= BIT(pos);
+	else
+		map->irq_high &= ~BIT(pos);
+
+	if (type & IRQ_TYPE_LEVEL_LOW)
+		map->irq_low |= BIT(pos);
+	else
+		map->irq_low &= ~BIT(pos);
+
+	return 0;
+}
+
+static void i2cs_gpio_irq_bus_lock(struct irq_data *data)
+{
+	struct i2cs_gpio *i2cs_gpio = irq_data_get_irq_chip_data(data);
+
+	mutex_lock(&i2cs_gpio->irq_lock);
+}
+
+static void i2cs_gpio_irq_bus_unlock(struct irq_data *data)
+{
+	struct i2cs_gpio *i2cs_gpio = irq_data_get_irq_chip_data(data);
+
+	mutex_unlock(&i2cs_gpio->irq_lock);
+}
+
+static struct irq_chip i2cs_gpio_irq_chip = {
+	.name = "jnx-gpio-i2cs",
+	.irq_mask = i2cs_gpio_irq_mask,
+	.irq_unmask = i2cs_gpio_irq_unmask,
+	.irq_set_type = i2cs_gpio_irq_set_type,
+	.irq_bus_lock = i2cs_gpio_irq_bus_lock,
+	.irq_bus_sync_unlock = i2cs_gpio_irq_bus_unlock,
+};
+
+static int i2cs_gpio_irq_map(struct irq_domain *domain, unsigned int irq,
+			     irq_hw_number_t hwirq)
+{
+	irq_set_chip_data(irq, domain->host_data);
+	irq_set_chip(irq, &i2cs_gpio_irq_chip);
+	irq_set_nested_thread(irq, true);
+	irq_set_noprobe(irq);
+
+	return 0;
+}
+
+static const struct irq_domain_ops i2cs_gpio_irq_domain_ops = {
+	.map = i2cs_gpio_irq_map,
+	.xlate = irq_domain_xlate_twocell,
+};
+
+static int i2cs_gpio_irq_setup(struct i2cs_gpio *i2cs_gpio)
+{
+	struct i2c_client *client = i2cs_gpio->client;
+	struct gpio_chip *chip = &i2cs_gpio->gpio;
+	int i, val, err;
+
+	mutex_init(&i2cs_gpio->irq_lock);
+
+	/* Cache initial register values */
+	for (i = 0; i < i2cs_gpio->num_regs; i++) {
+		struct i2c_gpio_map *map = &i2cs_gpio->map[i];
+
+		val = i2cs_gpio_read_byte_data(client, map->reg);
+		if (val < 0) {
+			dev_err(i2cs_gpio->dev,
+				"Failed to read register 0x%x: %d\n",
+				map->reg, val);
+			return val;
+		}
+		map->value = val;
+	}
+
+	i2cs_gpio->domain = irq_domain_add_linear(chip->of_node, chip->ngpio,
+						&i2cs_gpio_irq_domain_ops,
+						i2cs_gpio);
+
+	INIT_DELAYED_WORK(&i2cs_gpio->work, i2cs_gpio_worker);
+
+	if (i2cs_gpio->irq) {
+		err = request_threaded_irq(i2cs_gpio->irq, NULL,
+					   i2cs_gpio_irq_handler,
+					   IRQF_TRIGGER_RISING | IRQF_ONESHOT,
+					   dev_name(chip->parent), i2cs_gpio);
+		if (err) {
+			dev_err(chip->parent, "can't request IRQ#%d: %d\n",
+				i2cs_gpio->irq, err);
+			goto error;
+		}
+	} else {
+		schedule_delayed_work(&i2cs_gpio->work, HZ / 10);
+	}
+
+	chip->to_irq = i2cs_gpio_gpio_to_irq;
+	return 0;
+
+error:
+	irq_domain_remove(i2cs_gpio->domain);
+	return err;
+}
+
+static void i2cs_gpio_irq_teardown(struct i2cs_gpio *i2cs_gpio)
+{
+	unsigned int irq, i;
+
+	if (i2cs_gpio->irq)
+		free_irq(i2cs_gpio->irq, i2cs_gpio);
+	else
+		cancel_delayed_work_sync(&i2cs_gpio->work);
+
+	for (i = 0; i < i2cs_gpio->gpio.ngpio; i++) {
+		irq = irq_find_mapping(i2cs_gpio->domain, i);
+		if (irq > 0)
+			irq_dispose_mapping(irq);
+	}
+
+	irq_domain_remove(i2cs_gpio->domain);
+}
+
+static int i2cs_gpio_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *np = dev->of_node;
+	struct i2c_client *client;
+	struct i2cs_gpio *i2cs_gpio;
+	struct property *prop;
+	int num_regs;
+	int i, err;
+
+	if (!dev->parent)
+		return -ENODEV;
+
+	client = i2c_verify_client(dev->parent);
+	if (!client)
+		return -ENODEV;
+
+	i2cs_gpio = devm_kzalloc(dev, sizeof(*i2cs_gpio), GFP_KERNEL);
+	if (!i2cs_gpio)
+		return -ENOMEM;
+
+	prop = of_find_property(np, "i2c-gpio-map", &num_regs);
+	if (!prop)
+		return -EINVAL;
+	num_regs /= sizeof(u32);
+	if (!num_regs || (num_regs & 1))
+		return -EINVAL;
+	num_regs /= 2;
+
+	/*
+	 * If irq_of_parse_and_map() fails (returns 0), assume that
+	 * no interrupts are configured and that we need to poll instead.
+	 * We don't support deferred probes for this driver.
+	 */
+	i2cs_gpio->irq = irq_of_parse_and_map(np, 0);
+	i2cs_gpio->dev = dev;
+	i2cs_gpio->num_regs = num_regs;
+	i2cs_gpio->map = devm_kzalloc(dev,
+				      num_regs * sizeof(struct i2c_gpio_map),
+				      GFP_KERNEL);
+	if (!i2cs_gpio->map)
+		return -ENOMEM;
+
+	for (i = 0; i < num_regs; i++) {
+		struct i2c_gpio_map *map = &i2cs_gpio->map[i];
+		u32 val;
+
+		err = of_property_read_u32_index(np, "i2c-gpio-map", i * 2,
+						 &val);
+		if (err)
+			return err;
+		if (val > 0xff)
+			return -EINVAL;
+		map->reg = val;
+
+		err = of_property_read_u32_index(np, "i2c-gpio-map", i * 2 + 1,
+						 &val);
+		if (err)
+			return err;
+		if (val > 0xff)
+			return -EINVAL;
+		map->direction = val;
+	}
+
+	mutex_init(&i2cs_gpio->i2c_lock);
+	i2cs_gpio->client = client;
+
+	err = i2cs_gpio_gpio_setup(i2cs_gpio, num_regs << 3);
+	if (err < 0)
+		return err;
+
+	if (of_find_property(np, "interrupt-controller", NULL)) {
+		err = i2cs_gpio_irq_setup(i2cs_gpio);
+		if (err < 0)
+			return err;
+	}
+
+	err = gpiochip_add(&i2cs_gpio->gpio);
+	if (err < 0)
+		goto teardown;
+
+	platform_set_drvdata(pdev, i2cs_gpio);
+	return 0;
+
+teardown:
+	if (of_find_property(np, "interrupt-controller", NULL))
+		i2cs_gpio_irq_teardown(i2cs_gpio);
+
+	return err;
+}
+
+static int i2cs_gpio_remove(struct platform_device *pdev)
+{
+	struct i2cs_gpio *i2cs_gpio = platform_get_drvdata(pdev);
+	struct device_node *np = pdev->dev.of_node;
+
+	gpiochip_remove(&i2cs_gpio->gpio);
+
+	if (of_find_property(np, "interrupt-controller", NULL))
+		i2cs_gpio_irq_teardown(i2cs_gpio);
+
+	return 0;
+}
+
+static const struct of_device_id i2cs_gpio_of_match[] = {
+	{ .compatible = "jnx,gpio-i2cs", },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, i2cs_gpio_of_match);
+
+static struct platform_driver i2cs_gpio_driver = {
+	.driver = {
+		.name = "gpio-jnx-i2cs",
+		.owner = THIS_MODULE,
+		.of_match_table = of_match_ptr(i2cs_gpio_of_match),
+	},
+	.probe = i2cs_gpio_probe,
+	.remove = i2cs_gpio_remove,
+};
+module_platform_driver(i2cs_gpio_driver);
+
+MODULE_DESCRIPTION("Juniper Networks I2C to GPIO mapping driver");
+MODULE_AUTHOR("Guenter Roeck <groeck@juniper.net>");
+MODULE_LICENSE("GPL");
-- 
1.9.1
